From: Jesper Anderson <jesper@pobox.com>
Subject: Re: Pentium III Coppermine and 440BX/ZX/DX
Date: Tue, 17 Feb 2004 17:27:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040217162720.GA1202@acheron.utfors.se>
References: <20040217005504.GA809@acheron.utfors.se>
	<20040217095411.GV13262@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040217095411.GV13262@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Tue, Feb 17, 2004 at 10:54:11AM +0100, Bruno Ducrot wrote:
> 
> There is good chance that it work, but I think that you need to pass the
> smi_cmd=0x82 to speedstep-smi:
> 
> modprobe speedstep-smi smi_cmd=0x82

Ok, I played around a bit, rebooted, messed about - and suddenly this
worked. Well, sort of. I now have an interface to read information,
however, there's no way to set the CPU frequency; I can't find a write
interface?

# ls /sys/devices/system/cpu/cpu0/cpufreq/
cpuinfo_max_freq             scaling_driver    scaling_min_freq
cpuinfo_min_freq             scaling_governor
scaling_available_governors  scaling_max_freq

No scaling_setspeed interface to be found ...

This is with kernel 2.6.2 mm1. Anything else I can try. or anything I
missed here?

Thanks very much for the help so far, looks like this might end up
working!

Jesper
