import 'package:flutter/material.dart';
import 'package:rawdah/src/features/names/domain/name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllNames {
  static List<Name> allNames = [];

  static updateNames(BuildContext context) {
    var originalNames = [
      AppLocalizations.of(context)?.name_original_1,
      AppLocalizations.of(context)?.name_original_2,
      AppLocalizations.of(context)?.name_original_3,
      AppLocalizations.of(context)?.name_original_4,
      AppLocalizations.of(context)?.name_original_5,
      AppLocalizations.of(context)?.name_original_6,
      AppLocalizations.of(context)?.name_original_7,
      AppLocalizations.of(context)?.name_original_8,
      AppLocalizations.of(context)?.name_original_9,
      AppLocalizations.of(context)?.name_original_10,
      AppLocalizations.of(context)?.name_original_11,
      AppLocalizations.of(context)?.name_original_12,
      AppLocalizations.of(context)?.name_original_13,
      AppLocalizations.of(context)?.name_original_14,
      AppLocalizations.of(context)?.name_original_15,
      AppLocalizations.of(context)?.name_original_16,
      AppLocalizations.of(context)?.name_original_17,
      AppLocalizations.of(context)?.name_original_18,
      AppLocalizations.of(context)?.name_original_19,
      AppLocalizations.of(context)?.name_original_20,
      AppLocalizations.of(context)?.name_original_21,
      AppLocalizations.of(context)?.name_original_22,
      AppLocalizations.of(context)?.name_original_23,
      AppLocalizations.of(context)?.name_original_24,
      AppLocalizations.of(context)?.name_original_25,
      AppLocalizations.of(context)?.name_original_26,
      AppLocalizations.of(context)?.name_original_27,
      AppLocalizations.of(context)?.name_original_28,
      AppLocalizations.of(context)?.name_original_29,
      AppLocalizations.of(context)?.name_original_30,
      AppLocalizations.of(context)?.name_original_31,
      AppLocalizations.of(context)?.name_original_32,
      AppLocalizations.of(context)?.name_original_33,
      AppLocalizations.of(context)?.name_original_34,
      AppLocalizations.of(context)?.name_original_35,
      AppLocalizations.of(context)?.name_original_36,
      AppLocalizations.of(context)?.name_original_37,
      AppLocalizations.of(context)?.name_original_38,
      AppLocalizations.of(context)?.name_original_39,
      AppLocalizations.of(context)?.name_original_40,
      AppLocalizations.of(context)?.name_original_41,
      AppLocalizations.of(context)?.name_original_42,
      AppLocalizations.of(context)?.name_original_43,
      AppLocalizations.of(context)?.name_original_44,
      AppLocalizations.of(context)?.name_original_45,
      AppLocalizations.of(context)?.name_original_46,
      AppLocalizations.of(context)?.name_original_47,
      AppLocalizations.of(context)?.name_original_48,
      AppLocalizations.of(context)?.name_original_49,
      AppLocalizations.of(context)?.name_original_50,
      AppLocalizations.of(context)?.name_original_51,
      AppLocalizations.of(context)?.name_original_52,
      AppLocalizations.of(context)?.name_original_53,
      AppLocalizations.of(context)?.name_original_54,
      AppLocalizations.of(context)?.name_original_55,
      AppLocalizations.of(context)?.name_original_56,
      AppLocalizations.of(context)?.name_original_57,
      AppLocalizations.of(context)?.name_original_58,
      AppLocalizations.of(context)?.name_original_59,
      AppLocalizations.of(context)?.name_original_60,
      AppLocalizations.of(context)?.name_original_61,
      AppLocalizations.of(context)?.name_original_62,
      AppLocalizations.of(context)?.name_original_63,
      AppLocalizations.of(context)?.name_original_64,
      AppLocalizations.of(context)?.name_original_65,
      AppLocalizations.of(context)?.name_original_66,
      AppLocalizations.of(context)?.name_original_67,
      AppLocalizations.of(context)?.name_original_68,
      AppLocalizations.of(context)?.name_original_69,
      AppLocalizations.of(context)?.name_original_70,
      AppLocalizations.of(context)?.name_original_71,
      AppLocalizations.of(context)?.name_original_72,
      AppLocalizations.of(context)?.name_original_73,
      AppLocalizations.of(context)?.name_original_74,
      AppLocalizations.of(context)?.name_original_75,
      AppLocalizations.of(context)?.name_original_76,
      AppLocalizations.of(context)?.name_original_77,
      AppLocalizations.of(context)?.name_original_78,
      AppLocalizations.of(context)?.name_original_79,
      AppLocalizations.of(context)?.name_original_80,
      AppLocalizations.of(context)?.name_original_81,
      AppLocalizations.of(context)?.name_original_82,
      AppLocalizations.of(context)?.name_original_83,
      AppLocalizations.of(context)?.name_original_84,
      AppLocalizations.of(context)?.name_original_85,
      AppLocalizations.of(context)?.name_original_86,
      AppLocalizations.of(context)?.name_original_87,
      AppLocalizations.of(context)?.name_original_88,
      AppLocalizations.of(context)?.name_original_89,
      AppLocalizations.of(context)?.name_original_90,
      AppLocalizations.of(context)?.name_original_91,
      AppLocalizations.of(context)?.name_original_92,
      AppLocalizations.of(context)?.name_original_93,
      AppLocalizations.of(context)?.name_original_94,
      AppLocalizations.of(context)?.name_original_95,
      AppLocalizations.of(context)?.name_original_96,
      AppLocalizations.of(context)?.name_original_97,
      AppLocalizations.of(context)?.name_original_98,
      AppLocalizations.of(context)?.name_original_99,
    ];

    var transcriptionNames = [
      AppLocalizations.of(context)?.name_transcription_1,
      AppLocalizations.of(context)?.name_transcription_2,
      AppLocalizations.of(context)?.name_transcription_3,
      AppLocalizations.of(context)?.name_transcription_4,
      AppLocalizations.of(context)?.name_transcription_5,
      AppLocalizations.of(context)?.name_transcription_6,
      AppLocalizations.of(context)?.name_transcription_7,
      AppLocalizations.of(context)?.name_transcription_8,
      AppLocalizations.of(context)?.name_transcription_9,
      AppLocalizations.of(context)?.name_transcription_10,
      AppLocalizations.of(context)?.name_transcription_11,
      AppLocalizations.of(context)?.name_transcription_12,
      AppLocalizations.of(context)?.name_transcription_13,
      AppLocalizations.of(context)?.name_transcription_14,
      AppLocalizations.of(context)?.name_transcription_15,
      AppLocalizations.of(context)?.name_transcription_16,
      AppLocalizations.of(context)?.name_transcription_17,
      AppLocalizations.of(context)?.name_transcription_18,
      AppLocalizations.of(context)?.name_transcription_19,
      AppLocalizations.of(context)?.name_transcription_20,
      AppLocalizations.of(context)?.name_transcription_21,
      AppLocalizations.of(context)?.name_transcription_22,
      AppLocalizations.of(context)?.name_transcription_23,
      AppLocalizations.of(context)?.name_transcription_24,
      AppLocalizations.of(context)?.name_transcription_25,
      AppLocalizations.of(context)?.name_transcription_26,
      AppLocalizations.of(context)?.name_transcription_27,
      AppLocalizations.of(context)?.name_transcription_28,
      AppLocalizations.of(context)?.name_transcription_29,
      AppLocalizations.of(context)?.name_transcription_30,
      AppLocalizations.of(context)?.name_transcription_31,
      AppLocalizations.of(context)?.name_transcription_32,
      AppLocalizations.of(context)?.name_transcription_33,
      AppLocalizations.of(context)?.name_transcription_34,
      AppLocalizations.of(context)?.name_transcription_35,
      AppLocalizations.of(context)?.name_transcription_36,
      AppLocalizations.of(context)?.name_transcription_37,
      AppLocalizations.of(context)?.name_transcription_38,
      AppLocalizations.of(context)?.name_transcription_39,
      AppLocalizations.of(context)?.name_transcription_40,
      AppLocalizations.of(context)?.name_transcription_41,
      AppLocalizations.of(context)?.name_transcription_42,
      AppLocalizations.of(context)?.name_transcription_43,
      AppLocalizations.of(context)?.name_transcription_44,
      AppLocalizations.of(context)?.name_transcription_45,
      AppLocalizations.of(context)?.name_transcription_46,
      AppLocalizations.of(context)?.name_transcription_47,
      AppLocalizations.of(context)?.name_transcription_48,
      AppLocalizations.of(context)?.name_transcription_49,
      AppLocalizations.of(context)?.name_transcription_50,
      AppLocalizations.of(context)?.name_transcription_51,
      AppLocalizations.of(context)?.name_transcription_52,
      AppLocalizations.of(context)?.name_transcription_53,
      AppLocalizations.of(context)?.name_transcription_54,
      AppLocalizations.of(context)?.name_transcription_55,
      AppLocalizations.of(context)?.name_transcription_56,
      AppLocalizations.of(context)?.name_transcription_57,
      AppLocalizations.of(context)?.name_transcription_58,
      AppLocalizations.of(context)?.name_transcription_59,
      AppLocalizations.of(context)?.name_transcription_60,
      AppLocalizations.of(context)?.name_transcription_61,
      AppLocalizations.of(context)?.name_transcription_62,
      AppLocalizations.of(context)?.name_transcription_63,
      AppLocalizations.of(context)?.name_transcription_64,
      AppLocalizations.of(context)?.name_transcription_65,
      AppLocalizations.of(context)?.name_transcription_66,
      AppLocalizations.of(context)?.name_transcription_67,
      AppLocalizations.of(context)?.name_transcription_68,
      AppLocalizations.of(context)?.name_transcription_69,
      AppLocalizations.of(context)?.name_transcription_70,
      AppLocalizations.of(context)?.name_transcription_71,
      AppLocalizations.of(context)?.name_transcription_72,
      AppLocalizations.of(context)?.name_transcription_73,
      AppLocalizations.of(context)?.name_transcription_74,
      AppLocalizations.of(context)?.name_transcription_75,
      AppLocalizations.of(context)?.name_transcription_76,
      AppLocalizations.of(context)?.name_transcription_77,
      AppLocalizations.of(context)?.name_transcription_78,
      AppLocalizations.of(context)?.name_transcription_79,
      AppLocalizations.of(context)?.name_transcription_80,
      AppLocalizations.of(context)?.name_transcription_81,
      AppLocalizations.of(context)?.name_transcription_82,
      AppLocalizations.of(context)?.name_transcription_83,
      AppLocalizations.of(context)?.name_transcription_84,
      AppLocalizations.of(context)?.name_transcription_85,
      AppLocalizations.of(context)?.name_transcription_86,
      AppLocalizations.of(context)?.name_transcription_87,
      AppLocalizations.of(context)?.name_transcription_88,
      AppLocalizations.of(context)?.name_transcription_89,
      AppLocalizations.of(context)?.name_transcription_90,
      AppLocalizations.of(context)?.name_transcription_91,
      AppLocalizations.of(context)?.name_transcription_92,
      AppLocalizations.of(context)?.name_transcription_93,
      AppLocalizations.of(context)?.name_transcription_94,
      AppLocalizations.of(context)?.name_transcription_95,
      AppLocalizations.of(context)?.name_transcription_96,
      AppLocalizations.of(context)?.name_transcription_97,
      AppLocalizations.of(context)?.name_transcription_98,
      AppLocalizations.of(context)?.name_transcription_99,
    ];
    var translateNames = [
      AppLocalizations.of(context)?.name_translate_1,
      AppLocalizations.of(context)?.name_translate_2,
      AppLocalizations.of(context)?.name_translate_3,
      AppLocalizations.of(context)?.name_translate_4,
      AppLocalizations.of(context)?.name_translate_5,
      AppLocalizations.of(context)?.name_translate_6,
      AppLocalizations.of(context)?.name_translate_7,
      AppLocalizations.of(context)?.name_translate_8,
      AppLocalizations.of(context)?.name_translate_9,
      AppLocalizations.of(context)?.name_translate_10,
      AppLocalizations.of(context)?.name_translate_11,
      AppLocalizations.of(context)?.name_translate_12,
      AppLocalizations.of(context)?.name_translate_13,
      AppLocalizations.of(context)?.name_translate_14,
      AppLocalizations.of(context)?.name_translate_15,
      AppLocalizations.of(context)?.name_translate_16,
      AppLocalizations.of(context)?.name_translate_17,
      AppLocalizations.of(context)?.name_translate_18,
      AppLocalizations.of(context)?.name_translate_19,
      AppLocalizations.of(context)?.name_translate_20,
      AppLocalizations.of(context)?.name_translate_21,
      AppLocalizations.of(context)?.name_translate_22,
      AppLocalizations.of(context)?.name_translate_23,
      AppLocalizations.of(context)?.name_translate_24,
      AppLocalizations.of(context)?.name_translate_25,
      AppLocalizations.of(context)?.name_translate_26,
      AppLocalizations.of(context)?.name_translate_27,
      AppLocalizations.of(context)?.name_translate_28,
      AppLocalizations.of(context)?.name_translate_29,
      AppLocalizations.of(context)?.name_translate_30,
      AppLocalizations.of(context)?.name_translate_31,
      AppLocalizations.of(context)?.name_translate_32,
      AppLocalizations.of(context)?.name_translate_33,
      AppLocalizations.of(context)?.name_translate_34,
      AppLocalizations.of(context)?.name_translate_35,
      AppLocalizations.of(context)?.name_translate_36,
      AppLocalizations.of(context)?.name_translate_37,
      AppLocalizations.of(context)?.name_translate_38,
      AppLocalizations.of(context)?.name_translate_39,
      AppLocalizations.of(context)?.name_translate_40,
      AppLocalizations.of(context)?.name_translate_41,
      AppLocalizations.of(context)?.name_translate_42,
      AppLocalizations.of(context)?.name_translate_43,
      AppLocalizations.of(context)?.name_translate_44,
      AppLocalizations.of(context)?.name_translate_45,
      AppLocalizations.of(context)?.name_translate_46,
      AppLocalizations.of(context)?.name_translate_47,
      AppLocalizations.of(context)?.name_translate_48,
      AppLocalizations.of(context)?.name_translate_49,
      AppLocalizations.of(context)?.name_translate_50,
      AppLocalizations.of(context)?.name_translate_51,
      AppLocalizations.of(context)?.name_translate_52,
      AppLocalizations.of(context)?.name_translate_53,
      AppLocalizations.of(context)?.name_translate_54,
      AppLocalizations.of(context)?.name_translate_55,
      AppLocalizations.of(context)?.name_translate_56,
      AppLocalizations.of(context)?.name_translate_57,
      AppLocalizations.of(context)?.name_translate_58,
      AppLocalizations.of(context)?.name_translate_59,
      AppLocalizations.of(context)?.name_translate_60,
      AppLocalizations.of(context)?.name_translate_61,
      AppLocalizations.of(context)?.name_translate_62,
      AppLocalizations.of(context)?.name_translate_63,
      AppLocalizations.of(context)?.name_translate_64,
      AppLocalizations.of(context)?.name_translate_65,
      AppLocalizations.of(context)?.name_translate_66,
      AppLocalizations.of(context)?.name_translate_67,
      AppLocalizations.of(context)?.name_translate_68,
      AppLocalizations.of(context)?.name_translate_69,
      AppLocalizations.of(context)?.name_translate_70,
      AppLocalizations.of(context)?.name_translate_71,
      AppLocalizations.of(context)?.name_translate_72,
      AppLocalizations.of(context)?.name_translate_73,
      AppLocalizations.of(context)?.name_translate_74,
      AppLocalizations.of(context)?.name_translate_75,
      AppLocalizations.of(context)?.name_translate_76,
      AppLocalizations.of(context)?.name_translate_77,
      AppLocalizations.of(context)?.name_translate_78,
      AppLocalizations.of(context)?.name_translate_79,
      AppLocalizations.of(context)?.name_translate_80,
      AppLocalizations.of(context)?.name_translate_81,
      AppLocalizations.of(context)?.name_translate_82,
      AppLocalizations.of(context)?.name_translate_83,
      AppLocalizations.of(context)?.name_translate_84,
      AppLocalizations.of(context)?.name_translate_85,
      AppLocalizations.of(context)?.name_translate_86,
      AppLocalizations.of(context)?.name_translate_87,
      AppLocalizations.of(context)?.name_translate_88,
      AppLocalizations.of(context)?.name_translate_89,
      AppLocalizations.of(context)?.name_translate_90,
      AppLocalizations.of(context)?.name_translate_91,
      AppLocalizations.of(context)?.name_translate_92,
      AppLocalizations.of(context)?.name_translate_93,
      AppLocalizations.of(context)?.name_translate_94,
      AppLocalizations.of(context)?.name_translate_95,
      AppLocalizations.of(context)?.name_translate_96,
      AppLocalizations.of(context)?.name_translate_97,
      AppLocalizations.of(context)?.name_translate_98,
      AppLocalizations.of(context)?.name_translate_99,
    ];
    var descriptionNames = [
      AppLocalizations.of(context)?.name_description_1,
      AppLocalizations.of(context)?.name_description_2,
      AppLocalizations.of(context)?.name_description_3,
      AppLocalizations.of(context)?.name_description_4,
      AppLocalizations.of(context)?.name_description_5,
      AppLocalizations.of(context)?.name_description_6,
      AppLocalizations.of(context)?.name_description_7,
      AppLocalizations.of(context)?.name_description_8,
      AppLocalizations.of(context)?.name_description_9,
      AppLocalizations.of(context)?.name_description_10,
      AppLocalizations.of(context)?.name_description_11,
      AppLocalizations.of(context)?.name_description_12,
      AppLocalizations.of(context)?.name_description_13,
      AppLocalizations.of(context)?.name_description_14,
      AppLocalizations.of(context)?.name_description_15,
      AppLocalizations.of(context)?.name_description_16,
      AppLocalizations.of(context)?.name_description_17,
      AppLocalizations.of(context)?.name_description_18,
      AppLocalizations.of(context)?.name_description_19,
      AppLocalizations.of(context)?.name_description_20,
      AppLocalizations.of(context)?.name_description_21,
      AppLocalizations.of(context)?.name_description_22,
      AppLocalizations.of(context)?.name_description_23,
      AppLocalizations.of(context)?.name_description_24,
      AppLocalizations.of(context)?.name_description_25,
      AppLocalizations.of(context)?.name_description_26,
      AppLocalizations.of(context)?.name_description_27,
      AppLocalizations.of(context)?.name_description_28,
      AppLocalizations.of(context)?.name_description_29,
      AppLocalizations.of(context)?.name_description_30,
      AppLocalizations.of(context)?.name_description_31,
      AppLocalizations.of(context)?.name_description_32,
      AppLocalizations.of(context)?.name_description_33,
      AppLocalizations.of(context)?.name_description_34,
      AppLocalizations.of(context)?.name_description_35,
      AppLocalizations.of(context)?.name_description_36,
      AppLocalizations.of(context)?.name_description_37,
      AppLocalizations.of(context)?.name_description_38,
      AppLocalizations.of(context)?.name_description_39,
      AppLocalizations.of(context)?.name_description_40,
      AppLocalizations.of(context)?.name_description_41,
      AppLocalizations.of(context)?.name_description_42,
      AppLocalizations.of(context)?.name_description_43,
      AppLocalizations.of(context)?.name_description_44,
      AppLocalizations.of(context)?.name_description_45,
      AppLocalizations.of(context)?.name_description_46,
      AppLocalizations.of(context)?.name_description_47,
      AppLocalizations.of(context)?.name_description_48,
      AppLocalizations.of(context)?.name_description_49,
      AppLocalizations.of(context)?.name_description_50,
      AppLocalizations.of(context)?.name_description_51,
      AppLocalizations.of(context)?.name_description_52,
      AppLocalizations.of(context)?.name_description_53,
      AppLocalizations.of(context)?.name_description_54,
      AppLocalizations.of(context)?.name_description_55,
      AppLocalizations.of(context)?.name_description_56,
      AppLocalizations.of(context)?.name_description_57,
      AppLocalizations.of(context)?.name_description_58,
      AppLocalizations.of(context)?.name_description_59,
      AppLocalizations.of(context)?.name_description_60,
      AppLocalizations.of(context)?.name_description_61,
      AppLocalizations.of(context)?.name_description_62,
      AppLocalizations.of(context)?.name_description_63,
      AppLocalizations.of(context)?.name_description_64,
      AppLocalizations.of(context)?.name_description_65,
      AppLocalizations.of(context)?.name_description_66,
      AppLocalizations.of(context)?.name_description_67,
      AppLocalizations.of(context)?.name_description_68,
      AppLocalizations.of(context)?.name_description_69,
      AppLocalizations.of(context)?.name_description_70,
      AppLocalizations.of(context)?.name_description_71,
      AppLocalizations.of(context)?.name_description_72,
      AppLocalizations.of(context)?.name_description_73,
      AppLocalizations.of(context)?.name_description_74,
      AppLocalizations.of(context)?.name_description_75,
      AppLocalizations.of(context)?.name_description_76,
      AppLocalizations.of(context)?.name_description_77,
      AppLocalizations.of(context)?.name_description_78,
      AppLocalizations.of(context)?.name_description_79,
      AppLocalizations.of(context)?.name_description_80,
      AppLocalizations.of(context)?.name_description_81,
      AppLocalizations.of(context)?.name_description_82,
      AppLocalizations.of(context)?.name_description_83,
      AppLocalizations.of(context)?.name_description_84,
      AppLocalizations.of(context)?.name_description_85,
      AppLocalizations.of(context)?.name_description_86,
      AppLocalizations.of(context)?.name_description_87,
      AppLocalizations.of(context)?.name_description_88,
      AppLocalizations.of(context)?.name_description_89,
      AppLocalizations.of(context)?.name_description_90,
      AppLocalizations.of(context)?.name_description_91,
      AppLocalizations.of(context)?.name_description_92,
      AppLocalizations.of(context)?.name_description_93,
      AppLocalizations.of(context)?.name_description_94,
      AppLocalizations.of(context)?.name_description_95,
      AppLocalizations.of(context)?.name_description_96,
      AppLocalizations.of(context)?.name_description_97,
      AppLocalizations.of(context)?.name_description_98,
      AppLocalizations.of(context)?.name_description_99,
    ];

    var models = <Name>[];
    for (int i = 0; i < 99; i++) {
      models.add(Name(
        number: i + 1,
        original: originalNames[i] ?? 'error name_original_$i',
        transcription: transcriptionNames[i] ?? 'error name_transcription_$i',
        translate: translateNames[i] ?? 'error name_translate_$i',
        description: descriptionNames[i] ?? 'error name_description_$i',
      ));
    }

    allNames = models;
  }
}
