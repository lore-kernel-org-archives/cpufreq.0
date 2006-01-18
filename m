From: Mattia Dongili <malattia@linux.it>
Subject: Re: permissions on
	/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
Date: Wed, 18 Jan 2006 21:44:18 +0100
Message-ID: <20060118204418.GB3628@inferi.kami.home>
References: <20060118103423.C62755E401E@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060118103423.C62755E401E@latitude.mynet.no-ip.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anders@latitude.mynet.no-ip.org
Cc: cpufreq@lists.linux.org.uk

On Wed, Jan 18, 2006 at 11:34:23AM +0100, anders@latitude.mynet.no-ip.org wrote:
> 
> Hi,
> 
> I'd like for a selected group of users to be able to change the frequency.
> However, /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed is:
> 
> -rw-r--r--  1 root root 4096 Jan 18 11:24 scaling_setspeed
> 
> What's the best way to change that to another group and g+w ? (and no, I don't
> want to fiddle with sudo...)

you could install cpufrequtils and play with the suid bit and g/o
permissions for cpufreq-set, eg:

-rwsr-x---  1 root cpufreq 11976 2005-12-20 22:52 /usr/bin/cpufreq-set

But Dave is right, it doesn't make much sense.
-- 
mattia
:wq!
