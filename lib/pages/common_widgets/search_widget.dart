import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class SearchWidget extends StatefulWidget {

  final Function _onSearch;
  SearchWidget( this._onSearch );

  @override
  State<StatefulWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  final TextEditingController _filter = new TextEditingController();
  final FocusNode _filterFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      focusNode: _filterFocusNode,
      controller: _filter,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        border: InputBorder.none,
          prefixIcon: Image.asset('assets/images/search2.png'),
          hintText: 'search...',
          suffixIcon: InkWell(
            onTap: () => _clearSeach(),
            child: Icon(Icons.clear),
          ),
          hintStyle: AppStyles.getSFUITextLightStyle2(
              22.0, AppColors.blackColor3, FontWeight.w300)
      ),
      onFieldSubmitted: (text) => widget._onSearch( text ),
    );
  }

  _clearSeach(){
    _filter.text = "";
    _filterFocusNode.unfocus();
    widget._onSearch( "" );
  }

}