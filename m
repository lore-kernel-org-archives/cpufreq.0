From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep on Coppermine (asus M1)
Date: Mon, 15 Sep 2003 17:46:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030915154650.GI11391@poupinou.org>
References: <1063637650.7398.23.camel@linus.office.eurotux.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1063637650.7398.23.camel@linus.office.eurotux.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Manuel Oliveira <rmo@eurotux.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 15, 2003 at 03:54:10PM +0100, Ricardo Manuel Oliveira wrote:
> Hi all,
> 
>  I've been following the list for a while, but found no explanation on
> the strange behaviour I get with speedstep.
> 
>  Using an way old version (from 2002/08/15) and an older kernel version
> (2.4.18), I am able to use speedstep perfectly. The interface is the old
> one (/proc/sys/cpu/0/speed{-min,-max}).
> 
>  Upgrading to kernel 2.4.21 + cpufreq 2.4.21-2 + acpi-20030619
> downgrades the feature list: speedstep does not work (although a insmod
> speedstep-ich speedstep_coppermine=1 works) and acpi does not allow any
> performance change mode.
> 

echo 0%100%userspace > /proc/cpufreq
and then you can use the /proc/sys/cpu/0/* files.
Note also that you don't need anymore to use the speedstep_coppermine option.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
