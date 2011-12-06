From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: cpufreq governor with SMP support
Date: Tue, 6 Dec 2011 14:34:19 +0900
Message-ID: <CAJ0PZbQ7X4a_L9qqa=sa9HXNMVk-hODxmQ8y-=sdVF8Ww229_Q@mail.gmail.com>
References: <CAK9wHMTatnwEMKUYjykFzdWJXtoLbBC9fzOfn+gDYS+HMDcbKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=jsEZ7PaZG60LaFJ023AJ2c5fxW0zL5Yr4US51mssENU=;
        b=D4biwNKPcsnfaflnZWSkgFqC9LsCv238J1XuKS6eqVlz2KOBsX229qv6MbTcfGuwhs
         ECKfk+NOuYX+SX5QtBsRlzwbOfdtHkOcBxdRtSIk9DYFDgRXu5jrm7gxLwKehSDfmSkl
         ffVPwwzQ/WyEIXIyqquM50oAG4LY5III6+0xw=
In-Reply-To: <CAK9wHMTatnwEMKUYjykFzdWJXtoLbBC9fzOfn+gDYS+HMDcbKg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: chao xie <xiechao.linux@gmail.com>
Cc: cpufreq@vger.kernel.org, davej@redhat.com

On Mon, Dec 5, 2011 at 7:00 PM, chao xie <xiechao.linux@gmail.com> wrot=
e:
> Hi
> The CPUFreq ondemand governor will use =A0deferrable timer for cpu
> workload profiling.
> The deferrable timer will not invoke the core when the core is totall=
y idle.
> So for a SMP system, there are two cores, each one will have its own
> cpufreq_policy and do the profiling and change the frequency of core.
> I find that after system boot up, and I set the governor of the two
> cores to be =93ondemand=94. The profiling in CPU1 will never start be=
cause
> CPU1 is in idle, and the deferrable timer cpu profiling depends on
> will not wake up core.
> Is that a problem, or I made mistake about how to set up cpufreq in
> the SMP system?

If CPU1 is in idle indefinitely, why is not having CPU1 profiled a prob=
lem?

If CPU1 is not used, you don't need to profile and adjust the
frequency of CPU1 either, do you?



MyungJoo

> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
