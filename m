From: Dave Jones <davej@redhat.com>
Subject: Re: longhaul in 2.6.9 hangs VIA EPIA MII12000 when switching
	frequencies
Date: Mon, 6 Dec 2004 11:24:52 -0500
Message-ID: <20041206162452.GA14746@redhat.com>
References: <e256efa404120516422cb37625@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <e256efa404120516422cb37625@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: petr@konecny.cc
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

On Sun, Dec 05, 2004 at 04:42:54PM -0800, Petr Konecny wrote:
 > Hi,
 > 
 > the following script hangs my EPIA MII12000 within 5 seconds:
 > echo userspace >  /sys/devices/system/cpu/cpu0/scaling_governor
 > while true
 > do
 >    echo 532000 > /sys/devices/system/cpu/cpu0/cpufreq
 >    echo 1197000 >  /sys/devices/system/cpu/cpu0/cpufreq
 > done
 > 
 > When I run powernowd the system also crashes, usually when the
 > CPU/disk load changes often. Unfortunately this machine is headless so
 > I have no oops. Even netconsole is silent.
 > 
 > scaling_available_frequencies:
 > 532000 1197000 598000 731000 798000 931000 1064000 665000 864000
 > 997000 1130000 1197000
 > 
 > The motherboard has 1.2 GHz VIA Nehemiah CPU, cpu family 6, stepping 9. 
 > Loading longhaul prints:
 > longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.
 > 
 > I can do more tests upon request. Would compiling with debugging
 > reveal any secrets ?

Yup, I've managed to repeat this on my own Nehemiah too.
(For me, if I don't disable 'cpuspeed', the box dies within 5 minutes
 of use).  The bad news is, I've no idea what the problem is right now :-/

I'll keep poking at it.  It might be worth trying older versions of
the longhaul.c from earlier kernels and seeing if it ever worked properly.
A few months ago, I had a handful of bug reports from users of older C3s,
but my Nehemiah worked fine iirc. As time has gone on, it seems more
and more people have found it to be broken.  Either the number of people
using longhaul.c has increased over time, or the quality of the driver
has got worse and worse..

		Dave
