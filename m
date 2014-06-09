From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Mon, 09 Jun 2014 01:59:35 +0000
Message-ID: <bug-72361-12968-eVULWRCXEe@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

--- Comment #8 from ArLi Weng <arliweng@gmail.com> ---
(In reply to ArLi Weng from comment #7)
> (In reply to Zhang Rui from comment #6)
> > can you please git bisect which commit introduces this problem?
> 
> i don't known, maybe
> http://kernelnewbies.org/Linux_3.13#head-
> f95c198f6fdc7defe36f470dc8369cf0e16898df
> 
> for now, radeon.dpm=0 work but gpu clock is wrong(3d game too bad), that are
> 800MHz but 
> 
> #cat /sys/kernel/debug/dri/0/radeon_pm_info
> default engine clock: 200000 kHz
> current engine clock: 200000 kHz
> 
> on radeon.dpm=-1 without acpi_cpufreq:
> 
> #cat /sys/kernel/debug/dri/0/radeon_pm_info
> uvd    vclk: 0 dclk: 0
> power level 0    sclk: 30400 vddc: 949
> 

is this case i don't knwon which freq but 3d game work fine, and reset infinite
same time, i must boot to lts-kernel(3.10.42) before(boot to 3.10 then shutdown
to 3.14) kernel(3.14.5)

-- 
You are receiving this mail because:
You are the assignee for the bug.
