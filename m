From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 0/2] cpufreq: ondemand: add AMD specific powersave bias
Date: Fri, 5 Apr 2013 12:19:36 +0530
Message-ID: <CAKohpo=OeNfJnmbqxP-+bG1ZZahk6kZ-AjcXn-zRQw24_6UG5g@mail.gmail.com>
References: <1365092344-11310-1-git-send-email-jacob.shin@amd.com>
	<CAKohpomhBtR2aONp=GsOUeaM1=8f2ZN7EfcGyc1NYZX=ZsweWA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpomhBtR2aONp=GsOUeaM1=8f2ZN7EfcGyc1NYZX=ZsweWA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>, Borislav Petkov <bp@alien8.de>, Jacob Shin <jacob.shin@amd.com>

On 5 April 2013 10:19, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> For the latest versions sent by you (including {get|put}_online_cpus()):
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Hi Rafael,

I see that you have applied this patchset to bleeding-edge, but in
wrong order. You have applied 2/2 first and then 1/2, which is
wrong as after 2/2 we will have a compilation failure.
