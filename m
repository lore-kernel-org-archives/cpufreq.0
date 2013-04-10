From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Wed, 10 Apr 2013 07:53:32 +0200
Message-ID: <CA+icZUUEExm5Mktxoj6=UdzBe5HUzskktKWdHNOKaFXVHaySBg@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
	<CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
	<CA+icZUWH5Ni9koj4V8Ws8jJ7smwmU7JuUWBFh=aiCqkrCpqB5A@mail.gmail.com>
	<CAKohponzmLzPN8ua3p4TCt2waZCQCd+4Znh+tSQ4MBjcy+Ss6A@mail.gmail.com>
	<CA+icZUW12caZHDfgCV6E-1T4ExBPmu5bBNSqCzDwjUeidfRUPA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=7IxoTLoa0jEBjtzZRYbKVpSiqvAzvlXlmk8GxQAU2f8=;
        b=HqLSN77aFwagkg+PNDPrZrIKjcwG4l5wgS8NNPd8sh9SDInnVYs/N1nYckm1GSs7TI
         B/pZmPr7aQik3L9lsyCBVbN43m8mvJkDBU3CcCKlZXAN4f5qq1BGPr0FGhWPX1p9HHZU
         cgsfLI2tU9OMmzvhrEKk7mhP3odiNi/ZVuNt7flNHjhS3IlhgmZkj0Sd+dEwrxU3LJ9p
         qMK/EswEQ9WzYqw2SCJ1JE7uGCv+L09cHhl0yZlAxOBTQPAqsq6lxKrYNIEBM26uU2qe
         Nb3pr8e6ZA9yw5SyJA5eLxPEr0dbQEEVpDC3PxKGJuTWrs16s21zZg9LDNUjqhg6ai2f
         qnOg==
In-Reply-To: <CA+icZUW12caZHDfgCV6E-1T4ExBPmu5bBNSqCzDwjUeidfRUPA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Wed, Apr 10, 2013 at 7:41 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Tue, Apr 9, 2013 at 6:51 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> On 9 April 2013 21:38, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>> With x=3 the system gets in an unuseable state.
>>>
>>>      root# echo 0 > /sys/devices/system/cpu/cpu3/online
>>>
>>> I could not write my reply and had to do a hard/cold reboot.
>>> The dmesg log I saw looked similiar to my digicam-shot.
>>
>> Few things i need from you. First is output of cpufreq-info. Then
>> all the steps you did to reproduce above? Removed any other cpus?
>>
>
> Here is the output of cpufreq-info of the stable distro-kernel I am using.
> If you need the one from the "BROKEN" kernel, please let me know.
>
> - Sedat -

Hmm, I see that the kernel-sources itself ships a...

./tools/power/cpupower/utils/cpufreq-info.c

IIRC current 'make deb-pkg' does not build the tools, but I have seen
a patch on linux-kbuild ML.
Can I build cpufreq-info.c afterwards? Do I need a already-compiled build-dir?

Thanks in advance for answering my questions.

BTW, I have found a nice article on LWN "cpupowerutils - cpufrequtils
extended with quite some features" (see [1]).

- Sedat -

[1] http://lwn.net/Articles/433002/
