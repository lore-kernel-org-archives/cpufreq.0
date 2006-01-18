From: anders@latitude.mynet.no-ip.org
Subject: Re: permissions on
	/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
Date: Wed, 18 Jan 2006 23:20:41 +0100
Message-ID: <20060118222041.CD88E5E401E@latitude.mynet.no-ip.org>
References: <20060118103423.C62755E401E@latitude.mynet.no-ip.org> 
	<20060118204418.GB3628@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <20060118204418.GB3628@inferi.kami.home> 
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
To: cpufreq@lists.linux.org.uk


malattia@linux.it said:
> you could install cpufrequtils and play with the suid bit and g/o permissions
> for cpufreq-set, eg:
>
> -rwsr-x---  1 root cpufreq 11976 2005-12-20 22:52 /usr/bin/cpufreq-set
>
> But Dave is right, it doesn't make much sense. --

Ah, of course, that would work! (This is a single-user laptop so the
multi-ambition problems of a real multi-user system aren't there).

Thanks,
/Anders
