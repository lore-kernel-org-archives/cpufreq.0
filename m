From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Athlon XP-M and cpufreq freezing Asus laptop to death
Date: Mon, 25 Aug 2003 09:10:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030825071009.GH19292@poupinou.org>
References: <20030824164828.GA922@renditai.milesteg.arr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030824164828.GA922@renditai.milesteg.arr>
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
To: davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@www.linux.org.uk

On Sun, Aug 24, 2003 at 06:48:29PM +0200, Daniele Venzano wrote:
> I don't know if I'm hunting a bug or I have to add support for my
> hardware somewhere.
> I succeded in making C2 work adjusting the DSDT table, I'm uploading the 
> new one on acpi.sf.net under Asus/L3100D
> 
> Now for cpufreq: I'm using the powernow-k7 driver, since the acpi 
> P-state is not supported.
> Whenever I try to change the governor by echoing "powersave" in
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor everything stops
> and a hard reset is required. It seemes to fall in some tight loop since
> after a few seconds the fan goes on as if there is heavy processor
> usage.
> 
> With some printk I have verified that it halts inside wrmsrl() at line
> 199, file powernow-k7.c (2.6.0-test4).
> The call trace is:
> powernow_target/change_speed/change_FID/wrmsrl
> 
> For what is my knowledge (very, very little) the frequency passed to
> powernow_target is right, but I can't say nothing on all other
> parameters...
> 

This is a known issue (at least for me :).  When the difference
between 2 vid and/or 2 fid are too big, that hang.

For now, as a quick (and mostly dirty though) solution is to go
with the userspace governor only and to go to the lowest frequency with
one or two step in-between.

I'm also wondering if those athlons have the same kind of stuff than
the opteron (Dave)?

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
