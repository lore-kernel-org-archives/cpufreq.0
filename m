From: Georg Sauthoff <g_sauthoff@web.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Sat, 16 Aug 2003 10:28:50 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308161028.50976.g_sauthoff@web.de>
References: <200308160043.30649.g_sauthoff@web.de> <20030815213028.GB1738@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030815213028.GB1738@brodo.de>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

On Friday 15 August 2003 23:30, Dominik Brodowski wrote:
> That's not a bug, it's a feature. If you want to set the CPU frequency
> manually, you need to enable this "governor" first. [Other "governors" set
> to lowest and highest speed permanently (powersave/performance), and there
> could be many more such "governors" which adapt the CPU frequency to
> current system load etc. These only need to be written....]

Ok, I did not do RTMF enough I think ...

> So,
> # echo -n "0%0%100%userspace" > /proc/cpufreq
             ^^^^^^^^ What does this mean?

> first, then you can use the
> /proc/sys/cpu/0/speed
> file to set the CPU speed manually.

Hm, unfortunetly after I set the userspace governor (like above) the 
/proc/sys/cpu/0/s* gives me 0 again ...

In the kernel logs I don't see any messages from cpufreq. Ok, after a very 
quick look at the patch sources I don't see printk's there, too.

Regards
Georg Sauthoff
