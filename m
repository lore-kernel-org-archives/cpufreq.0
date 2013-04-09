From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Tue, 9 Apr 2013 18:08:46 +0200
Message-ID: <CA+icZUWH5Ni9koj4V8Ws8jJ7smwmU7JuUWBFh=aiCqkrCpqB5A@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
	<CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=8374C5mKKTSiPLlxGPugGKcfccL6gygLVKFYmiXNw+I=;
        b=bXyMAqwQXazQziKo0jcBpsVWQ+JzHge3hGxC1biY30SmL8Q0REo5LHG00jE1igtlbg
         yy/z/kRtH9G+LI4p3ZjKgkO2N4HtNkQ3MNgaeNI510LfytJvEBJhonahX8GpZxbq5oUi
         Pkc6tODNDk3XCxNVCYkPWKxFAmsw0Wnk5Xj4MRYE3FJP/zHnzXQxl6sTBe0VT92swYLk
         U8Ew4ujjL2hObO9h7GP9653TJdLdQ6l1bvfPKommTzLD9pSnUEFgBe5XNtXZekO1zYoT
         xJAPwRC7GSxyV4HeIQ22sbxB09C1HWhguMbVYF042euqXp6Xx5jeg3Ri5jQwRdwP1A0L
         SXaA==
In-Reply-To: <CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
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

With x=3 the system gets in an unuseable state.

     root# echo 0 > /sys/devices/system/cpu/cpu3/online

I could not write my reply and had to do a hard/cold reboot.
The dmesg log I saw looked similiar to my digicam-shot.

- Sedat -
