From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Feature request (was: Pentium 4m kernel 2.4.21)
Date: Wed, 27 Aug 2003 01:10:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030826231001.GB31977@brodo.de>
References: <000001c3694b$6b4eb5d0$0200a8c0@informatik.domaene>
	<3F473898.4020101@gotiao.com> <3F4746DB.9080303@gotiao.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F4746DB.9080303@gotiao.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viktor Radnai <efti@gotiao.com>
Cc: cpufreq@www.linux.org.uk

Oh well, so users want to use 150 MHz instead of 1600 MHz now...
In fact, I have some ideas to allow same-time usage of a 
	throttling
and a
	frequency and voltage scaling
driver. But IMHO NOT for 2.4. and NOT for 2.6. It's something which might be
worthy of discussion for 2.7.

	Dominik

On Sat, Aug 23, 2003 at 08:50:03PM +1000, Viktor Radnai wrote:
> Hi all,
> 
> I wonder if it would be possible to modify the cpufreq driver modules so
> that more than one could be loaded at the same time (speedstep-ich and
> p4-clockmod are good examples). Perhaps change the location of the
> cpufreq virtual files from /sys/devices/system/cpu/cpu0/cpufreq/ to
> /sys/devices/system/cpu/cpu0/cpufreq/<modulename>/ ?
> 
> Cheers,
> Vik
> 
> Viktor Radnai wrote:
> >Hi Martin,
> >
> >I've managed to clock down my 2GHz Pentium 4m to around 150MHz by doing 
> >the following:
> >
> >- compile both speedstep and p4-clockmod as modules
> >- modprobe speedstep
> >- set the governor to powersave
> >- rmmod speedstep
> >- modprobe p4-clockmod
> >- set the CPU speed
> >
> >Hope this helps,
> >
> >Vik
> >
> >Martin Klinkigt (multimedia-test) wrote:
> >
> >>Hello,
> >>I has a Pentium 4 m and the 2.4.21 Kernel with cpufreq-2.4.21-2. Now I 
> >>can change the frequency in each case between 1,2 and 1,6 Ghz.
> >>Under Windows I had it however already on 400 MHz.
> >>
> >>Can I change it somehow that he is further as 1.2 Ghz down? 
> >>Thanks
> >>Martin
