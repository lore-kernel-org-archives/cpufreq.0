From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] drivers:cpufreq:unicore32: fix typo issue for 'clk'
Date: Tue, 08 Apr 2014 13:11:28 +0200
Message-ID: <1431533.Y4a186K14A@vostro.rjw.lan>
References: <53429445.5000005@gmail.com> <53434A4E.2050407@gmail.com> <CAKohponSStjFJyKt7Yy7EX1wfk3xbJxoXpt47qStcSGfQVK7aw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohponSStjFJyKt7Yy7EX1wfk3xbJxoXpt47qStcSGfQVK7aw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

On Tuesday, April 08, 2014 09:38:16 AM Viresh Kumar wrote:
> On 8 April 2014 06:31, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> >> @stable: please apply this for v3.14, as it broke in that cycle..
> 
> This wouldn't work..
> 
> > Thank you.
> 
> Can you please send it again for stable as well?

I have labeled it for -stable and it doesn't work like that.  -stable won't
take any patches you send them before the commits in question are in the
Linus' tree anyway.  And you need to provide the original commit hashes then.

Thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
