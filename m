From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Cpufreq hang
Date: Sat, 19 Jul 2003 22:25:15 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030719202515.GA731@brodo.de>
References: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com> <20030716145325.GC632@inferi.kami.home> <Pine.LNX.4.53.0307161929430.30922@h192n1fls22o1048.telia.com>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0307161929430.30922@h192n1fls22o1048.telia.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Braennlund <johan.brannlund@telia.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 16, 2003 at 07:53:44PM +0200, Johan Braennlund wrote:
> 
> On Wed, 16 Jul 2003, Mattia Dongili wrote:
> 
> > can you write directly to /proc/cpufreq without using the daemon?
> > eg:
> > echo "0%0%100%performance" > /proc/cpufreq
> 
> That works, but if I substitute "powersave" for "performance" the system
> hangs. In fact, I tried various changes in the above and anything with
> "performance" works and anything with "powersave" hangs. The kernel I'm
> using is 2.5.74-mm1, but I've seen cpufreqd hang on other recent 2.5
> kernels as well, so I imagine the situation would be the same there.
> 
> On a 2.4 kernel, all the commands I tried worked.

Can you please re-test it with 2.6.0-test1, and especially check whether the
following works:

a) loading the "userspace" governor [please modprobe it first, of course]
cd /sys/devices/system/cpu/cpu0/cpufreq/
echo -n "userspace" > scaling_governor

b) slowly decrease the current frequency by echoing the corresponding values
[in kHz!] into scaling_setspeed. You can read the frequency states supported
by your notebook in the "PST table" which is printed in dmesg. 

c) if these slow transitions work, please change the frequency more
"randomly", and also try to switch from lowest to highest frequency and
backwards.

d) please tell us whether these tests worked, or at what stage [esp. at what
frequency] it failed. Also, please include the part of "dmesg" where the PST
table is printed.

Many thanks for testing cpufreq,
	Dominik
