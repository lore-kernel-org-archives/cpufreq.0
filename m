From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Tue, 9 Apr 2013 16:59:20 +0200
Message-ID: <CA+icZUV219yQ2Bw=81C8e_cfNERjCENNOvokehQ=bzc66-+L2w@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
	<CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=HrzHtnCoNK398zGNW38VQQzRThJ2bFOXaKIEr+sH/WM=;
        b=XFueGZVNNS56ox8ihONPn/9g8KNS40hY17nqf2CksX5DHM4/o4T+ZRmMdlk0cKN7UF
         rQua65t5PbQd0AgrM5m1IRENjr057lYgptmF8fSi7CFM1Hf8n60k4fEHM8tAAbNmN/xm
         ECbbJRXOJdpmmcfYebIIlG9uzTDOYnN1BdV5CIJoxRckE3DucPUn8A7hlKS5E3AfpLro
         CAH+fXV6HqLxGwCyXmF1YlddFHdt3RvOwUeq/UlgAM+khMmYyDXFRwIysPyRb1Scv7cI
         J/lQwnDff5OBUtcblcdObZDJ4UCgjSHg2T1BobyxNdb65a5wU0tVAYZtpcRY/qIe/HO6
         XRBg==
In-Reply-To: <CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Tue, Apr 9, 2013 at 4:56 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 9 April 2013 19:34, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> I have seen it on reboots.
>> How to online/offline from sysfs?
>
> offline a cpu "x" with:
>
> echo 0 > /sys/devices/system/cpu/cpux/online
>
> and online with echo 1 > to same location.

Eh, yeah I re-remember it now :-).
I will try with next-20130328 which boots fine here and hope the
hanging on reboot and in running system is OK.

next-20130409 is broken due to vfs-next issues (see Linux-Next ML).
Will try that first...

- Sedat -
