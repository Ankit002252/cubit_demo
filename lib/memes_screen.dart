import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'cubits/memes_state.dart';
import 'cubits/mems_cubit.dart';

class MemesScreen extends StatefulWidget {
  const MemesScreen({Key? key}) : super(key: key);

  @override
  State<MemesScreen> createState() => _MemesScreenState();
}

class _MemesScreenState extends State<MemesScreen> {
  @override
  void initState() {
    print("---------11---???");
    context.read<MemesCubit>().getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<MemesCubit, MemesState>(
        listener: (context, state) {
          if (state is MemesLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(""),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MemesWelcomeState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MemesLoadedState) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.memesData!.data!.memes!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: SlideAnimation(
                      child: Container(
                        height: 150,
                        color: Colors.white,
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                          imageUrl: state.memesData!.data!.memes![index].url
                              .toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 100,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                // CachedNetworkImage(
                //   fit: BoxFit.cover,
                //   imageUrl:
                //       state.memesData!.data!.memes![index].url.toString(),
                // ),
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

// GridView.builder(
// padding: const EdgeInsets.all(8),
// itemCount: 5,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisSpacing: 16,
// mainAxisSpacing: 16,
// crossAxisCount:  2),
// itemBuilder: (BuildContext context, int index) {
// return Container(height: 150,color: Colors.cyan,);
// },
// ),
