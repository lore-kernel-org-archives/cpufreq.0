From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Tue, 9 Apr 2013 16:04:53 +0200
Message-ID: <CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=ocgVrUEWNaPBAeZXgi3rlQje0NaZ9p4aJAiAZuOHVDk=;
        b=v+cfMmQ0UOK0G7kvR2GRzN0yf19L8KoFzFNmIhpNQIW+qgp0kO3xKMiI+/oioj9+xN
         lWLGpZrD4edRWZdeIBFj/46p4JX9WVa/X34OYhljI6mHcvGj3LJRHzt4pWQVaIE8g4dq
         zPsjdkTTsfpNZCxvy6w4XfwPiccziGSvPF5rW6olc5gCLe+xRtLvbbLvXW54VILowvjY
         nhCh5Updv5igpoicJhCQp3XcoJ3P5q0QuRaGjpxcPmaXXYYpkv1GcAbcJjiHIH0AmNBH
         nwYGnHVGalYeI7ImyaMhKvsrCwsIdFsI+5lCcApeX7q7sOkri3j+VGtMALrMJu5TwRGB
         kcCA==
In-Reply-To: <31778276.CDMUtaAAnc@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>

On Tue, Apr 9, 2013 at 4:03 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Tuesday, April 09, 2013 02:47:39 PM Sedat Dilek wrote:
>> On Tue, Apr 9, 2013 at 11:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi all,
>> >
>> > Changes since 20130408:
>> >
>> > The vfs tree still had its build failure so I used the version from
>> > next-20130405.
>> >
>> > The wireless-next tree lost its build failure.
>> >
>> > The mfd tree still had its build failure so I used the version from
>> > next-20130405.
>> >
>> > The ftrace tree gained a conflict against Linus' tree.
>> >
>> > The arm-soc tree gained conflicts against the omap_dss2 and gpio-lw trees.
>> >
>> > ----------------------------------------------------------------------------
>> >
>>
>> On reboot I see hanging cpufreq with the help of kdb/kgdb?
>> See screenshot.
>>
>> I have also a screenshot with next-20130326, so this issue seems not to be new.
>
> This is during CPU offline.  Does it only happen on reboot?  What about trying
> to offline/online CPUs from sysfs?
>

I have seen it on reboots.
How to online/offline from sysfs?

- Sedat -

> Rafael
>
>
> --
> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.
