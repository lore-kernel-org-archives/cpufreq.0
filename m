From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: speedstep-centrino not working with Intel Pentium M 1.73
Date: Fri, 6 Oct 2006 19:48:09 -0400
Message-ID: <20061006234809.GB7751@dominikbrodowski.de>
References: <op.telgsuax8oynmf@mthef.bredband.comhem.se>
	<20061002233226.GF9748@dominikbrodowski.de>
	<op.tguglvpx8oynmf@mthef.bredband.comhem.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <op.tguglvpx8oynmf@mthef.bredband.comhem.se>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Forsgren <mk0foma@student.chalmers.se>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Oct 03, 2006 at 01:52:33PM +0200, Martin Forsgren wrote:
> Den 2006-10-03 01:32:26 skrev Dominik Brodowski  
> <linux@dominikbrodowski.net>:
> 
> >Hi,
> >
> >On Sun, Aug 20, 2006 at 08:11:08PM +0200, Martin Forsgren wrote:
> >>I can run "p4-clockmode" but then I only get maximum 1.3GHz.
> >>None of the other cpufreq variants work.
> >>
> >>Found a patch for 'dothan'-processors but I don't know
> >>wich one that is, or if I can use it on my cpu.
> >>http://stefans.datenbruch.de/acerTM292/
> >
> >No, better not use that one.
> >
> >Does "modprobe acpi-cpufreq" on a _recent_ kernel (-mm is fine)
> >help?
> >
> >Thanks,
> >	Dominik
> 
> This ive tested:
> 
> 	kernel 2.6.17-11 ( patched for reiser4-for-2.6.17-3.patch.gz )
> 	acpi-cpufreq works but not speedstep-centrino
> 
> 	linux-image-2.6.18-rc4-mm1
> 	only p4-clockmode works, maximum 1.3GHz
> 
> Any special combination you want me to try?
> Got a Pentium-M 1.73.
> 
> Is there any difference between acpi-cpufreq and speedstep-centrino?
> Someone wrote that its almost only voltage scaling that lower energy
> consumtion. Is it right and does acpi-cpufreq this?

Mostly. Yes, only speedstep-centrino and acpi-cpufreq tend to lower voltage,
but not p4-clockmod. Yes, only speedstep-centrino and acpi-cpufreq lower
energy consumtion under normal circumstances. So you really want to use
acpi-cpufreq in this case.

	Dominik
