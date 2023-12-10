import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComunTitle extends StatefulWidget {
  final String title;
  final String path;
  const ComunTitle({
    super.key,
    required this.title,
    required this.path,
  });

  @override
  State<ComunTitle> createState() => _ComunTitleState();
}

class _ComunTitleState extends State<ComunTitle> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: constraints.maxWidth < 600
                    ? const TextStyle(
                        fontSize: 18,
                        color: Color(0xff000000),
                      )
                    : const TextStyle(
                        color: Color(0xff000000),
                        overflow: TextOverflow.ellipsis),
              ),
              Flexible(
                child: Wrap(
                  runSpacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/home.svg",
                          height: constraints.maxWidth < 600 ? 14 : 16,
                          width: constraints.maxWidth < 600 ? 14 : 16,
                          color: const Color(0xff000000)),
                    ),
                    Text('   /   ${widget.path}   /   ',
                        style: TextStyle(
                            color: const Color(0xff000000),
                            fontSize: constraints.maxWidth < 600 ? 12 : 14),
                        overflow: TextOverflow.ellipsis),
                    Text(widget.title,
                        style: TextStyle(
                            color: const Color(0xff0059E7),
                            fontSize: constraints.maxWidth < 600 ? 12 : 14),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
