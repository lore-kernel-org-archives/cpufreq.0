From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Fri, 15 Aug 2003 23:30:28 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030815213028.GB1738@brodo.de>
References: <200308160043.30649.g_sauthoff@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308160043.30649.g_sauthoff@web.de>
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
To: Georg Sauthoff <g_sauthoff@web.de>
Cc: cpufreq@www.linux.org.uk

Hi Georg,

On Sat, Aug 16, 2003 at 12:43:30AM +0200, Georg Sauthoff wrote:
> So I have /proc/sys/cpu/0/, but "cat speed speed-max speed-min" prints only 0 
> to the console.
That's not a bug, it's a feature. If you want to set the CPU frequency
manually, you need to enable this "governor" first. [Other "governors" set
to lowest and highest speed permanently (powersave/performance), and there
could be many more such "governors" which adapt the CPU frequency to current
system load etc. These only need to be written....]

So, 
# echo -n "0%0%100%userspace" > /proc/cpufreq
first, then you can use the
/proc/sys/cpu/0/speed
file to set the CPU speed manually.

	Dominik
