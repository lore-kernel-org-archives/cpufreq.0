From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Unit of cpuinfo.transition_latency
Date: Tue, 2 Apr 2013 21:07:10 +0530
Message-ID: <CAOh2x=k5Uo26kOjvGaCZ9rWgQVpwtrDwTNF3EKjr5kByFhDKFQ@mail.gmail.com>
References: <CAMefCkA3zy8-+DA2zQYirkvNyZcwYUDAsWBYhR_4TEF3b9DZQA@mail.gmail.com>
	<CAMefCkCkSzrKUHD4QK_akr9Lc2sqW6uwxeHFHVk82uK5oz4yfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=RkUHCLXwhxjlsCmM1vyMYi5BknXfFRcgGllxztOLvjY=;
        b=qlzEtOpflgtkm6JrcPIzljqyxnaX20pKQbY/G1wVnV1j4LECyd7odYubcdfL4ntBYM
         jxfuP02gyBQy/UeN6annkWE3PD/D2HnfD3rbAPgkncU37fGYgv+XUv0LaT9PfQuWc91k
         e3MMeNRtjaWf+KVCbmZgl4hpEUPq85nYgv3yYMWTR8Av1R+WCSVA3njRDvERmhn/7KXJ
         AAMs9F08YkXWtvMJ1nM43Nj21QVKjV29R/mHBbUhUWANLvLxUH22FHeX91aBlIarw/xy
         8slNZNJR4zKM3XDop7Uw8nkwaktbfuIBG5WBPZJ+i42LfXTscOVqmZJC1ZjT0rb9iVMW
         gheg==
In-Reply-To: <CAMefCkCkSzrKUHD4QK_akr9Lc2sqW6uwxeHFHVk82uK5oz4yfA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: cpufreq@vger.kernel.org

On Tue, Apr 2, 2013 at 8:37 PM, Guru Prasad <gurupras@buffalo.edu> wrote:
> I've been working with kernel versions 2.6.35.8 and 3.3.0 particularly
> with the ARM architecture and I'm quite confused with the units of
> transition_latency..
>
> mach-integrator/cpu.c:    policy->cpuinfo.transition_latency =
> 1000000; /* 1 ms, assumed */
> mach-pxa/cpufreq-pxa2xx.c:    policy->cpuinfo.transition_latency =
> 1000; /* FIXME: 1 ms, assumed */
> mach-pxa/cpufreq-pxa3xx.c:    policy->cpuinfo.transition_latency =
> 1000; /* FIXME: 1 ms, assumed */
>
> These seem to be contradicting each other..
> The first line seems to suggest that the base unit is nanoseconds..
> The second and third lines suggest that the unit is microseconds..
>
> Could someone please shed some light on this?

include/linux/cpufreq.h

 * Maximum transition latency is in nanoseconds
