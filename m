From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Cpufreq on AMD dual opteron 242
Date: Thu, 1 Jul 2004 17:32:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701153236.GG5614@poupinou.org>
References: <200407011123.i61BNtI04740@esemetz.metz.supelec.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200407011123.i61BNtI04740@esemetz.metz.supelec.fr>
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
To: "Marc.Thierry" <thierry_mar@metz.supelec.fr>
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 01, 2004 at 01:23:55PM +0200, Marc.Thierry wrote:
> 
> Hi,
> 
> i'm having problems with using cpufreq on my dual opteron.
> i've already used cpufreq on a p4 and i was able to make it work.
> 
> 'dmesg |grep powernow' returns :
> 
> powernow-k8: Power state transitions not supported
> powernow-k8: Power state transitions not supported
> 
> after a 'modprobe powernow-k8' and of course there's no file at "/sys/devices/system/cpu/cpu*/"
> 

Could you please include a
cat /proc/cpuinfo
in your report?  Thanks.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
