<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "lc_course".
 *
 * @property integer $id
 * @property string $tag
 * @property integer $cid
 * @property string $code
 * @property string $name
 * @property string $name_short
 * @property string $desc_short
 * @property string $desc_long
 * @property string $img
 * @property integer $item_count
 * @property integer $total_time
 * @property integer $class_time
 * @property double $price
 * @property double $rprice
 * @property string $video_express
 * @property string $teacher_names
 * @property string $teacher_ids
 * @property integer $create_date
 * @property integer $update_date
 * @property integer $credit
 * @property string $classtype
 * @property string $memo
 * @property integer $isdelete
 * @property integer $type
 * @property string $exam_type
 * @property integer $liberty_type
 * @property integer $course_tag
 * @property string $course_lecturer
 * @property integer $class_id
 * @property integer $courseclass_id
 * @property integer $isfree
 * @property string $source
 * @property integer $ishot
 * @property integer $isbest
 * @property integer $isnew
 * @property integer $weights
 * @property integer $sellnum
 * @property integer $corder
 * @property integer $owner_type
 * @property integer $owner
 * @property double $rprice2
 * @property double $rprice3
 * @property double $order_amount
 * @property integer $order_stu
 * @property integer $share_type
 * @property string $share_ratio
 * @property string $desc_catalog
 * @property integer $status
 * @property integer $is_show
 * @property integer $study_num
 * @property integer $try_see_num
 */
class LcCourse extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'lc_course';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid', 'item_count', 'total_time', 'class_time', 'create_date', 'update_date', 'credit', 'isdelete', 'type', 'liberty_type', 'course_tag', 'class_id', 'courseclass_id', 'isfree', 'ishot', 'isbest', 'isnew', 'weights', 'sellnum', 'corder', 'owner_type', 'owner', 'order_stu', 'share_type', 'status', 'is_show', 'study_num', 'try_see_num'], 'integer'],
            [['desc_long', 'desc_catalog'], 'string'],
            [['price', 'rprice', 'rprice2', 'rprice3', 'order_amount'], 'number'],
            [['tag', 'name', 'desc_short', 'img', 'video_express', 'classtype', 'memo', 'exam_type'], 'string', 'max' => 255],
            [['code', 'name_short', 'course_lecturer', 'share_ratio'], 'string', 'max' => 50],
            [['teacher_names'], 'string', 'max' => 250],
            [['teacher_ids'], 'string', 'max' => 150],
            [['source'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tag' => 'Tag',
            'cid' => '课程中心课程',
            'code' => '课程编号',
            'name' => '课程名称',
            'name_short' => '简称',
            'desc_short' => '文件简介',
            'desc_long' => '课程介绍',
            'img' => '课程封面图片',
            'item_count' => '集数',
            'total_time' => '总时长',
            'class_time' => '课时数',
            'price' => '价格',
            'rprice' => '折扣价',
            'video_express' => '试听视频',
            'teacher_names' => '老师名字',
            'teacher_ids' => 'Teacher Ids',
            'create_date' => '授权日期',
            'update_date' => '更新日期',
            'credit' => '学分',
            'classtype' => '课程标签',
            'memo' => '信息备注',
            'isdelete' => '0:未删除1:已删除',
            'type' => 'Type',
            'exam_type' => 'Exam Type',
            'liberty_type' => 'Liberty Type',
            'course_tag' => 'Course Tag',
            'course_lecturer' => 'Course Lecturer',
            'class_id' => '培训机构',
            'courseclass_id' => '课程类型',
            'isfree' => '是否免费',
            'source' => '来源',
            'ishot' => '热门',
            'isbest' => '推荐',
            'isnew' => '新款',
            'weights' => '权重',
            'sellnum' => 'Sellnum',
            'corder' => 'Corder',
            'owner_type' => '所属人的类型',
            'owner' => '所属的老师',
            'rprice2' => '团体价',
            'rprice3' => '协议价',
            'order_amount' => '订单金额',
            'order_stu' => '订单人数',
            'share_type' => '分成方式',
            'share_ratio' => '分成比例',
            'desc_catalog' => '课程目录信息',
            'status' => '审核状态',
            'is_show' => '是否上架',
            'study_num' => '学习次数',
            'try_see_num' => '试看次数',
        ];
    }
}
