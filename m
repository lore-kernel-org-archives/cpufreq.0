From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: New governor?
Date: Wed, 23 Jan 2013 20:15:18 +0100
Message-ID: <2365004.JupvNoxXgf@vostro.rjw.lan>
References: <20130123190711.GA8394@jshin-Toonie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130123190711.GA8394@jshin-Toonie>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jacob Shin <jacob.shin@amd.com>
Cc: cpufreq@vger.kernel.org

On Wednesday, January 23, 2013 01:07:12 PM Jacob Shin wrote:
> Rafael, cpufreq list,
> 
> I was wondering ..
> 
> - Is hardware architecture specific governor acceptable in upstream?
>   i.e. drivers/cpufreq/cpufreq_amd_governor.c

It generally is, although the details of implementation matter too.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
