From: Jarkko Lavinen <jlavi@iki.fi>
Subject: Re: [Patch] powernow-k7-manual was Re: [Patch] small cleanup for
	powernow-k7.c
Date: Wed, 26 Jan 2005 10:03:40 +0200
Message-ID: <20050126080340.GA2068@smooth.piipiip.net>
References: <200501202138.35324.Hendrik.Muhs@web.de>
	<20050121015736.GB32430@redhat.com>
	<200501252147.59169.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200501252147.59169.Hendrik.Muhs@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Muhs <Hendrik.Muhs@web.de>
Cc: Adam Jones <adam@yggdrasl.demon.co.uk>, Dave Jones <davej@redhat.com>, cpufreq@zenii.linux.org.uk

On Tue, Jan 25, 2005 at 09:47:58PM +0100, Hendrik Muhs wrote:
> To the list: Please complain now!

Hi Hendrik

I tried the patch and it works alright. I have few beauty issues.

There are two consequtive dprintks in powernow_manual_settings() which need 
to be unified:

-                               dprintk("   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
-                                       fid_codes[fid] / 10,
-                                       fid_codes[fid] % 10, speed / 1000);
-                               dprintk("VID: 0x%x (%d.%03dV)\n", vid,
-                                       mobile_vid_table[vid] / 1000,
+                               dprintk("   FID: 0x%x (%d.%dx [%dMHz])\t"
+                                      "VID: 0x%x (%d.%03dV)\n", 
+                                      fid, fid_codes[fid] / 10, 
+                                      fid_codes[fid] % 10, speed / 1000,
+                                      vid, mobile_vid_table[vid] / 1000,
+                                      mobile_vid_table[vid] % 1000);


And there is one unneeded check from my fsb code in powernow_cpu_init(). fsb
is unsigned, myltiplied by 1000 and already checked to be nonzero, so checking
for fsb < 1000 is really not needed.


                if (fsb < 1000)
                        fsb *= 1000;

-               if (fsb < 1000 || fsb > 1000000) {
+               if (fsb > 1000000) {
                        printk(KERN_WARNING PFX "FSB %ukhz out of range\n",
                               fsb);
                        return -EINVAL;



> I use it for a HTPC which has a MATX mainboard and a XP-M 2400+. With 
> reduced Vcore (BIOS setting), FSB of 100 Mhz (instead of 133 Mhz) and 
> this patch I am able to run the CPU without a fan.

I am building a VDR/HTPC box with very similar desires.

Jarkko Lavinen
