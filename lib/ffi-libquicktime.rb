require 'ffi'

module Quicktime
  extend FFI::Library
  ffi_lib 'libquicktime'

  #
  # http://libquicktime.sourceforge.net/doc/apiref/group__general.html
  #

  # Get the quicktime4linux major version. 
  #  int  quicktime_major ()
  attach_function :quicktime_major, [], :int

  # Get the quicktime4linux minor version. 
  #  int   quicktime_minor ()
  attach_function :quicktime_minor, [], :int

  # Get the quicktime4linux release number. 
  #  int   quicktime_release ()
  attach_function :quicktime_release, [], :int

  # Test file compatibility. 
  #  int   quicktime_check_sig (char *path)
  attach_function :quicktime_check_sig, [:string], :int

  # Open a file. 
  #  quicktime_t *   quicktime_open (const char *filename, int rd, int wr)
  attach_function :quicktime_open, [:string, :int, :int], :pointer

  # Make a file streamable. 
  #  int   quicktime_make_streamable (char *in_path, char *out_path)
  attach_function :quicktime_make_streamable, [:string, :pointer], :int

  # Close a quicktime handle and free all associated memory. 
  #  int   quicktime_close (quicktime_t *file)
  attach_function :quicktime_close, [:pointer], :int

  # Dump the file structures to stdout. 
  #  int   quicktime_dump (quicktime_t *file)
  attach_function :quicktime_dump, [:pointer], :int

  # Set the number of CPUs. 
  #  int   quicktime_set_cpus (quicktime_t *file, int cpus)
  attach_function :quicktime_set_cpus, [:pointer, :int], :int

  # Write an AVI file instead of quicktime. 
  #  void  quicktime_set_avi (quicktime_t *file, int value)
  attach_function :quicktime_set_avi, [:pointer, :int], :int

  # Return the raw filedescriptor associated with the file. 
  #  int   lqt_fileno (quicktime_t *file)
  attach_function :lqt_fileno, [:pointer], :int

  # Get the codec API version. 
  #  int   lqt_get_codec_api_version ()

  # Query if the function is an AVI.   
  #  int   lqt_is_avi (quicktime_t *file)
  attach_function :lqt_is_avi, [:pointer], :int

  # Get the WAVE id of an audio track. 
  #  int  lqt_get_wav_id (quicktime_t *file, int track)
  attach_function :lqt_get_wav_id, [:pointer, :int], :int

  # Get a human readable filetype. 
  #  const char *  lqt_file_type_to_string (lqt_file_type_t type)
  attach_function :lqt_file_type_to_string, [:pointer], :string

  # Get the filetype. 
  #  lqt_file_type_t   lqt_get_file_type (quicktime_t *file)
  attach_function :lqt_get_file_type, [:pointer], :pointer

  # Open a file for reading. 
  #  quicktime_t *   lqt_open_read (const char *filename)
  attach_function :lqt_open_read, [:string], :pointer

  # Open a file for reading. 
  #  quicktime_t *   lqt_open_read_with_log (const char *filename, lqt_log_callback_t cb, void *log_data)
  #attach_function :lqt_open_read_with_log, [:string, :pointer, :pointer], :pointer

  # Open a file for writing. 
  #  quicktime_t *   lqt_open_write (const char *filename, lqt_file_type_t type)
  attach_function :lqt_open_write, [:string, :pointer], :pointer

  # Open a file for writing. 
  #  quicktime_t *   lqt_open_write_with_log (const char *filename, lqt_file_type_t type, lqt_log_callback_t cb, void *log_data)
  attach_function :lqt_open_write_with_log, [:string, :pointer, :pointer, :pointer], :pointer

  # Set the segment size for ODML AVIs. 
  #  void  lqt_set_max_riff_size (quicktime_t *file, int size)
  attach_function :lqt_set_max_riff_size, [:string, :int], :void


  #
  # http://libquicktime.sourceforge.net/doc/apiref/group__video__decode.html
  #

  # Get the video length. 
  #  long  quicktime_video_length (quicktime_t *file, int track)
  attach_function :quicktime_video_length, [:pointer, :int], :long

  # Get the video position. 
  #  long  quicktime_video_position (quicktime_t *file, int track)
  attach_function :quicktime_video_position, [:pointer, :int], :long

  # Get the number of video tracks. 
  #  int   quicktime_video_tracks (quicktime_t *file)
  attach_function :quicktime_video_tracks, [:pointer], :int

  # Check if a file has at least one video track. 
  #  int   quicktime_has_video (quicktime_t *file)
  attach_function :quicktime_has_video, [:pointer], :int

  # Get the width of a video track. 
  #  int   quicktime_video_width (quicktime_t *file, int track)
  attach_function :quicktime_video_width, [:pointer, :int], :int

  # Get the height of a video track. 
  #  int   quicktime_video_height (quicktime_t *file, int track)
  attach_function :quicktime_video_height, [:pointer, :int], :int

  # Get the depth of a video track. 
  #  int   quicktime_video_depth (quicktime_t *file, int track)
  attach_function :quicktime_video_depth, [:pointer, :int], :int

  # Get the framerate of a video track. 
  #  double  quicktime_frame_rate (quicktime_t *file, int track)
  attach_function :quicktime_frame_rate, [:pointer, :int], :double

  # Get the four character code of a video track. 
  #  char *  quicktime_video_compressor (quicktime_t *file, int track)
  attach_function :quicktime_video_compressor, [:pointer, :int], :pointer

  # Get the compressed size of frame in a video track. 
  #  long  quicktime_frame_size (quicktime_t *file, long frame, int track)
  attach_function :quicktime_frame_size, [:pointer, :long, :int], :long

  # Seek to a specific video frame. 
  #  int   quicktime_set_video_position (quicktime_t *file, int64_t frame, int track)
  attach_function :quicktime_set_video_position, [:pointer, :int64, :int], :int

  # Read a compressed video frame. 
  # long  quicktime_read_frame (quicktime_t *file, unsigned char *video_buffer, int track)
  attach_function :quicktime_read_frame, [:pointer, :pointer, :int], :long

  # Check if a video track is supported by libquicktime. 
  #  int   quicktime_supported_video (quicktime_t *file, int track)
  attach_function :quicktime_supported_video, [:pointer, :int], :int

  # Check if a colormodel is supported for decoding. 
  #  int   quicktime_reads_cmodel (quicktime_t *file, int colormodel, int track)
  attach_function :quicktime_reads_cmodel, [:pointer, :int, :int], :int

  # Decode a video frame in BC_RGB888. 
  #  int   quicktime_decode_video (quicktime_t *file, unsigned char **row_pointers, int track)
  attach_function :quicktime_decode_video, [:pointer, :pointer, :int], :int

  # Decode aand optionally scale a video frame. 
  # long  quicktime_decode_scaled (quicktime_t *file, int in_x, int in_y, int in_w, int in_h, int out_w, int out_h, int color_model, unsigned char **row_pointers, int track)
  attach_function :quicktime_decode_scaled, [:pointer, :int, :int, :int, :int, :int, :int, :int, :pointer, :int], :long

  # Get the pixel aspect ratio of a video track. 
  #  int   lqt_get_pixel_aspect (quicktime_t *file, int track, int *pixel_width, int *pixel_height)
  attach_function :lqt_get_pixel_aspect, [:pointer, :int, :pointer, :pointer], :int

  # Get the interlace mode. 
  #  lqt_interlace_mode_t  lqt_get_interlace_mode (quicktime_t *file, int track)
  attach_function :lqt_get_interlace_mode, [:pointer, :int], :pointer

  # Get the chroma placement. 
  #  lqt_chroma_placement_t  lqt_get_chroma_placement (quicktime_t *file, int track)
  attach_function :lqt_get_chroma_placement, [:pointer, :int], :pointer

  # Get the native colormodel of the decoder. 
  #  int   lqt_get_decoder_colormodel (quicktime_t *file, int track)
  attach_function :lqt_get_decoder_colormodel, [:pointer, :int], :int

  # Get the timestamp of the next frame to be decoded. 
  #  int64_t   lqt_frame_time (quicktime_t *file, int track)
  attach_function :lqt_frame_time, [:pointer, :int], :int64

  # Decode one video frame. 
  #  int   lqt_decode_video (quicktime_t *file, unsigned char **row_pointers, int track)
  attach_function :lqt_decode_video, [:pointer, :pointer, :int], :int

  # Read a compressed video frame. 
  #  int   lqt_read_video_frame (quicktime_t *file, uint8_t **buffer, int *buffer_alloc, int64_t frame, int64_t *time, int track)
  attach_function :lqt_read_video_frame, [:pointer, :pointer, :pointer, :int64, :pointer, :int], :int

  # Get the duration of the NEXT frame to be decoded. 
  #  int   lqt_frame_duration (quicktime_t *file, int track, int *constant)
  attach_function :lqt_frame_duration, [:pointer, :int, :pointer], :int

  # Get the timescale of the track. 
  #  int   lqt_video_time_scale (quicktime_t *file, int track)
  attach_function :lqt_video_time_scale, [:pointer, :int], :int

  # Get the duration of a video track. 
  #  int64_t   lqt_video_duration (quicktime_t *file, int track)
  attach_function :lqt_video_duration, [:pointer, :int], :int64

  # Seek to a specific video time. 
  #  void  lqt_seek_video (quicktime_t *file, int track, int64_t time)
  attach_function :lqt_seek_video, [:pointer, :int, :int64], :void

  #
  # http://libquicktime.sourceforge.net/doc/apiref/group__color.html
  #
  BC_RGB565     = 2
  BC_BGR565     = 3
  BC_BGR888     = 4
  BC_BGR8888    = 5
  BC_RGB888     = 6
  BC_RGBA8888   = 7
  BC_RGB161616  = 8
  BC_RGBA16161616 = 9
  BC_YUVA8888   = 10
  BC_YUV422     = 13
  BC_YUV420P    = 14
  BC_YUV422P    = 15
  BC_YUV444P    = 16
  BC_YUV411P    = 17
  BC_YUVJ420P   = 18
  BC_YUVJ422P   = 19
  BC_YUVJ444P   = 20
  BC_YUV422P16  = 21
  BC_YUV444P16  = 22
  LQT_COLORMODEL_NONE = -1

  # Convert a colormodel to a human readable string. 
  #  const char *  lqt_colormodel_to_string (int colormodel)
  attach_function :lqt_colormodel_to_string, [:int], :string

  # Convert a description string to a colormodel. 
  # int   lqt_string_to_colormodel (const char *str)
  attach_function :lqt_string_to_colormodel, [:string], :int

  # Check if a colormodel is planar. 
  #  int   lqt_colormodel_is_planar (int colormodel)
  attach_function :lqt_colormodel_is_planar, [:int], :int

  # Check if a colormodel has an alpha (transperency) channel. 
  #  int   lqt_colormodel_has_alpha (int colormodel)
  attach_function :lqt_colormodel_has_alpha, [:int], :int

  # Check, if a colormodel is RGB based. 
  #  int   lqt_colormodel_is_rgb (int colormodel)
  attach_function :lqt_colormodel_is_rgb, [:int], :int

  # Check, if a colormodel is YUV based. 
  #  int   lqt_colormodel_is_yuv (int colormodel)
  attach_function :lqt_colormodel_is_yuv, [:int], :int

  # Get the chroma subsampling factors. 
  #  void  lqt_colormodel_get_chroma_sub (int colormodel, int *sub_h, int *sub_v)
  attach_function :lqt_colormodel_get_chroma_sub, [:int, :pointer, :pointer], :void

  # Get the default row span for a colormodel and an image width. 
  #  void  lqt_get_default_rowspan (int colormodel, int width, int *rowspan, int *rowspan_uv)
  attach_function :lqt_get_default_rowspan, [:int, :int, :pointer, :pointer], :void

  # Check if a colormodel conversion is supported by libquicktime. 
  #  int   lqt_colormodel_has_conversion (int in_cmodel, int out_cmodel)
  attach_function :lqt_colormodel_has_conversion, [:int, :int], :int

  # Get number of supported colormodels. 
  # int   lqt_num_colormodels ()
  attach_function :lqt_num_colormodels, [], :int

  # Get a colormodel string. 
  #  const char *  lqt_get_colormodel_string (int index)
  attach_function :lqt_get_colormodel_string, [:int], :string

  # Get a colormodel. 
  #  int   lqt_get_colormodel (int index)
  attach_function :lqt_get_colormodel, [:int], :int


  #
  # http://libquicktime.sourceforge.net/doc/apiref/group__video.html
  #

  # Set the colormodel for en-/decoding. 
  #  void  quicktime_set_cmodel (quicktime_t *file, int colormodel)
  attach_function :quicktime_set_cmodel, [:pointer, :int], :void

  # Set the row_span for en-/decoding. 
  #  void  quicktime_set_row_span (quicktime_t *file, int row_span)
  attach_function :quicktime_set_row_span, [:pointer, :int], :void

  # Set a codec parameter for a video track. 
  #  void  lqt_set_video_parameter (quicktime_t *file, int track, const char *key, const void *value)
  attach_function :lqt_set_video_parameter, [:pointer, :int, :string, :string], :void

  # Convert an interlace mode to a human readable string. 
  #  const char *  lqt_interlace_mode_to_string (lqt_interlace_mode_t mode)
  attach_function :lqt_interlace_mode_to_string, [:pointer], :string

  # Convert a chroma placement to a human readable string. 
  #  const char *  lqt_chroma_placement_to_string (lqt_chroma_placement_t chroma_placement)
  attach_function :lqt_chroma_placement_to_string, [:pointer], :string

  # Get the best colormodel out of a list of supported colormodels. 
  #  int   lqt_get_best_colormodel (quicktime_t *file, int track, int *supported)
  attach_function :lqt_get_best_colormodel, [:pointer, :int, :pointer], :int

  # Get the colormodel, which will be valid for the next en-/decode call. 
  #  int   lqt_get_cmodel (quicktime_t *file, int track)
  attach_function :lqt_get_cmodel, [:pointer, :int], :int

  # Allocate a frame buffer for use with libquicktime. 
  #  uint8_t **  lqt_rows_alloc (int width, int height, int colormodel, int *rowspan, int *rowspan_uv)
  attach_function :lqt_rows_alloc, [:int, :int, :int, :pointer, :pointer], :pointer

  # Copy a video frame. 
  #  void  lqt_rows_copy (uint8_t **out_rows, uint8_t **in_rows, int width, int height, int in_rowspan, int in_rowspan_uv, int out_rowspan, int out_rowspan_uv, int colormodel)
  attach_function :lqt_rows_copy, [:pointer, :pointer, :int, :int, :int, :int, :int, :int, :int], :void

  # Free a frame allocated by lqt_rows_alloc. 
  #  void  lqt_rows_free (uint8_t **rows)
  attach_function :lqt_rows_free, [:pointer], :void

  # Set the colormodel for en-/decoding. 
  #  void  lqt_set_cmodel (quicktime_t *file, int track, int colormodel)
  attach_function :lqt_set_cmodel, [:pointer, :int, :int], :void

  # Set the row span for the luma plane. 
  #  void  lqt_set_row_span (quicktime_t *file, int track, int row_span)
  attach_function :lqt_set_row_span, [:pointer, :int, :int], :void

  # Set the row span for the chroma planes.
  #  void  lqt_set_row_span_uv (quicktime_t *file, int track, int row_span_uv)
  attach_function :lqt_set_row_span_uv, [:pointer, :int, :int], :void


end


if $0 == __FILE__

  filename = 'test.mov'

  file = Quicktime.lqt_open_read(filename)
  video_tracks = Quicktime.quicktime_video_tracks(file)
  track = 0

  _supported = Quicktime.quicktime_supported_video(file, track)
  width, height = Quicktime.quicktime_video_width(file, track), Quicktime.quicktime_video_height(file, track)

  p '%s  %i %i  %ix%i length:%i' % [filename, _supported, video_tracks, width, height, Quicktime.quicktime_video_length(file, track) ]


  p Quicktime.lqt_get_cmodel(file, track)
    Quicktime.lqt_set_cmodel(file, track, Quicktime::BC_RGB888)
  p Quicktime.lqt_get_cmodel(file, track)


  rowspan = FFI::MemoryPointer.new(:int, 2)
  p data_ptr = Quicktime.lqt_rows_alloc(width, height, Quicktime::BC_RGB888, rowspan[0], rowspan[1])

  p Quicktime.lqt_frame_time(file, track)
  p Quicktime.lqt_decode_video(file, data_ptr, track)

  p Quicktime.lqt_frame_time(file, track)
  p Quicktime.lqt_decode_video(file, data_ptr, track)

  p data_ptr.get_array_of_uint8(0, 100)
end

