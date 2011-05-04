From: Tomas.Linden@Helsinki.FI
Subject: Re: Intel Core 2 Quad Q8400 reported as Unknown CPU
Date: Wed, 4 May 2011 14:19:36 +0300 (EEST)
Message-ID: <alpine.LFD.2.00.1105041413220.2195@tux.hip.helsinki.fi>
References: <alpine.LFD.2.00.1104291730500.2256@tux.hip.helsinki.fi> <20110429192101.GA5498@redhat.com>
Reply-To: Tomas.Linden@Helsinki.FI
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-546738350-1304507976=:2195"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110429192101.GA5498@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-546738350-1304507976=:2195
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Dave!

On Fri, 29 Apr 2011, Dave Jones wrote:

 > On Fri, Apr 29, 2011 at 05:50:00PM +0300, Tomas.Linden@helsinki.fi wrote:
 >  > Hello!
 >  >
 >  > I upgraded my Intel Core 2 Duo to a Core 2 Quad Q8400 on my Intel DP3=
5DP motherboard.
 >  > I send this mail because I found this messages in my dmesg:
 >  >
 >  > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kern=
el.org>
 >  > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kern=
el.org>
 >  > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kern=
el.org>
 >  > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kern=
el.org>
 >
 > ignore it, p4-clockmod is a waste of bits anyway.
 >
 >  > cpuinfo and dmesg are at the end of this e-mail. I'm a bit worried be=
cause
 >  > I bought the new CPU to have hardware virtualization support (VT-X).
 >  >   http://ark.intel.com/Product.aspx?id=3D38512&processor=3DQ8400&spec=
-codes=3DSLGT6
 >  > but cpuinfo does not list the vtx flag for me. I'm using Fedora 13 an=
d I
 >  > tried booting to a F14 USB stick as well and neither shows the vtx fl=
ag.
 >
 >  ...
 >
 >  > processor	: 0
 >  > vendor_id	: GenuineIntel
 >  > cpu family	: 6
 >  > model		: 23
 >  > model name	: 06/17
 >                   ^^^^^
 > This is a sign your BIOS has no idea what that CPU is. It should be a ni=
ce
 > non-numeric name.
 >
 > Which could explain why VTX isn't showing up.  (Possibly also EST too, w=
hich
 > would be much better than using p4-clockmod).

 > Look for a BIOS update.

Thanks for the hint about the BIOS being the cause of the problem! I was
running the very latest BIOS available for this motheboard, but Intel
suggested that I restore default BIOS settings and recovery reflash the
same BIOS version that I already was using to have the correct microcode
being loaded by the BIOS into the CPU. This solved this problem. Now the
  "p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.=
org>"
messages are gone from my dmesg and /proc/cpuinfo recognizes my CPU as
  processor       : 0
  vendor_id       : GenuineIntel
  cpu family      : 6
  model           : 23
  model name      : Intel(R) Core(TM)2 Quad CPU    Q8400  @ 2.66GHz

Best regards,                          Tomas Lind=E9n
--------------------------------------------------------------------------
I           ,                                                            I
I Tomas Linden                   Helsinki Institute of Physics (HIP)     I
I Tomas.Linden@Helsinki.FI       P.O. Box 64 (Gustaf H=E4llstr=F6min katu 2=
) I
I phone: +358-9-191 505 63       FI-00014 UNIVERSITY OF HELSINKI         I
I fax:   +358-9-191 505 22       Finland                                 I
I WWW: http://www.physics.helsinki.fi/~tlinden/eindex.html               I
--------------------------------------------------------------------------
--8323328-546738350-1304507976=:2195--
