From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Tue, 9 Apr 2013 18:57:49 +0200
Message-ID: <CA+icZUW+SuJurKp-_CWW4Q22YCJUOmfDCsqaQxv6OLhE0_pjpw@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
	<CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
	<CA+icZUWH5Ni9koj4V8Ws8jJ7smwmU7JuUWBFh=aiCqkrCpqB5A@mail.gmail.com>
	<CAKohponzmLzPN8ua3p4TCt2waZCQCd+4Znh+tSQ4MBjcy+Ss6A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=aSfuzhWYsPDUnQ6UWH3E0JlcFDh4Hwtp0Jr4NG2Ft6g=;
        b=VyZLwsCumA4tmFpeQzRMYfS9F/K8QXIYqP+HjE2YmCdOBvm4/k2MEO0A/NfxSkn3i7
         mLJPnwQSgETM0GD7ZgIiVEvbdBKDp5keZSjHI1jr3CkZKMyO/2OvKZIzfuvPiPk67YBc
         sV17JfuyORYQbAMo7euNi4LMmT2pRTgrM+HhVmyKw5sATKaiCyx4G468zHKMrBeKS/3j
         PZvbKwOteZvJyjE7hDqf1jIAI6hVLOCDyUJ9xEoE6rRrO7vUIznrTwxhLA/9woJmMu9u
         H/DZvUoy3PYflhbeTRi7+bsoA7a61GrUhiXwyycOFfyJ8BreWwdw8j5/vqJqD/sHVn7o
         0ljg==
In-Reply-To: <CAKohponzmLzPN8ua3p4TCt2waZCQCd+4Znh+tSQ4MBjcy+Ss6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Tue, Apr 9, 2013 at 6:51 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 9 April 2013 21:38, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> With x=3 the system gets in an unuseable state.
>>
>>      root# echo 0 > /sys/devices/system/cpu/cpu3/online
>>
>> I could not write my reply and had to do a hard/cold reboot.
>> The dmesg log I saw looked similiar to my digicam-shot.
>
> Few things i need from you. First is output of cpufreq-info. Then
> all the steps you did to reproduce above? Removed any other cpus?
>
> I am not able to find next-20130326 tag in my repo, only have 23 and 28.
> Can you debug it a bit to find exact line of code causing this issue using
> objdump?
>
> HINT: Documentation/BUG-HUNTING..
>

next-20130326 see...

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tag/?id=next-20130326

objdump of file?

> Give me line numbers of both of these functions: __cpufreq_governor() and
> __cpufreq_remove_dev().

I must checkout by myself and jump on next-20130326.
Unfortunately, I have it installed but have no binaries and deleted
the branch from my local GIT branch.

Still on the fs/pipe issue from vfs-next :-).
I guess I have a working follow-up patch, still compiling.

- Sedat -
