From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Cpufreq hang
Date: Wed, 16 Jul 2003 16:53:25 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030716145325.GC632@inferi.kami.home>
References: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com>
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
To: cpufreq@www.linux.org.uk

On Wed, Jul 16, 2003 at 04:31:34PM +0200, Johan Braennlund wrote:
> Hi! It seems like there's a bug in cpufreq in the 2.5 kernels.
> 
> When using recent 2.5-series kernels and running on battery, cpufreqd
> locks up hard when it's started. If I run on AC power, everything works
> fine.

so are you still compiling with the deprecated /proc interface?
(cpufreqd 1.0 is broken wrt 2.[56] sysfs - the CVS code is fixed though)

> If I use a 2.4 kernel, such as 2.4.20-wolk4.0s-rc3 everything works fine,
> no matter whether I run off the battery or not.
> 
> When the machine hangs, nothing appears in the logs, it just locks up and
> I have to power it off. I'm using an Acer Aspire with an Athlon XP 1800+
> processor.

can you write directly to /proc/cpufreq without using the daemon?
eg:
echo "0%0%100%performance" > /proc/cpufreq

-- 
mattia
:wq!
