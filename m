From: Dave Jones <davej@redhat.com>
Subject: Re: Intel Core 2 Quad Q8400 reported as Unknown CPU
Date: Fri, 29 Apr 2011 15:21:02 -0400
Message-ID: <20110429192101.GA5498@redhat.com>
References: <alpine.LFD.2.00.1104291730500.2256@tux.hip.helsinki.fi>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1104291730500.2256@tux.hip.helsinki.fi>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas.Linden@helsinki.fi
Cc: cpufreq@vger.kernel.org

On Fri, Apr 29, 2011 at 05:50:00PM +0300, Tomas.Linden@helsinki.fi wrote:
 > Hello!
 > 
 > I upgraded my Intel Core 2 Duo to a Core 2 Quad Q8400 on my Intel DP35DP motherboard.
 > I send this mail because I found this messages in my dmesg:
 > 
 > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
 > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
 > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
 > p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>

ignore it, p4-clockmod is a waste of bits anyway. 

 > cpuinfo and dmesg are at the end of this e-mail. I'm a bit worried because
 > I bought the new CPU to have hardware virtualization support (VT-X).
 >   http://ark.intel.com/Product.aspx?id=38512&processor=Q8400&spec-codes=SLGT6
 > but cpuinfo does not list the vtx flag for me. I'm using Fedora 13 and I
 > tried booting to a F14 USB stick as well and neither shows the vtx flag.

 ...
 
 > processor	: 0
 > vendor_id	: GenuineIntel
 > cpu family	: 6
 > model		: 23
 > model name	: 06/17
                  ^^^^^
This is a sign your BIOS has no idea what that CPU is. It should be a nice
non-numeric name.

Which could explain why VTX isn't showing up.  (Possibly also EST too, which
would be much better than using p4-clockmod).

Look for a BIOS update.

	Dave

