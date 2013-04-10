From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 10
Date: Wed, 10 Apr 2013 12:40:32 +0200
Message-ID: <CA+icZUWYHv5h26Q6xr30=UxavD52ZX6W1vfTKj8n6gyuCz0q3g@mail.gmail.com>
References: <20130410184852.92a3a02bbe5c3a040be76365@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=M5Jptv2FcPb5gy8BhDS+JQhREHkae9L3QxI55cZfqfA=;
        b=BAXIqIEYrsXrcDC8ygGph1wHcdHPEZ0Nr6zVXKUDUUcKsrj/LcxrA5UcyBHP8rSIuu
         6GAeC0JaLp+JUcPjQlbZve/aDj9xi/OzPFVKM/a1yOGHJ6wWYqWje35PTcu5NtW0av9m
         skZ0PwXMCg8nzmJNdD2HlOr+b9kD+OmqyOVY7/ICz7ZRDYppO9D0Iz92nHlzxhxpTd37
         R4eJVjTEF4tt6ERIhErEBX0eadayN10cKMncpLqIQZg979RzZi9MlZObAXaYD/8UoBjB
         NyoK2nRzE+Y8RMVsxm/YuZxQHguBCrcuHattVj9djCqhjNeFut4CoFkAcj8TsrGMeK24
         PjAA==
In-Reply-To: <20130410184852.92a3a02bbe5c3a040be76365@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, cpufreq@vger.kernel.org

On Wed, Apr 10, 2013 at 10:48 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20130409:
>
> The vfs tree lost its build failure.
>

Beyond build-failures in vfs-next [0] and [1], it was not bootable
(see [2] till [4])!
This is now all fixed, thanks to all involved people!

$ cat /proc/version
Linux version 3.9.0-rc6-next20130410-1-iniza-small
(sedat.dilek@gmail.com@fambox) (gcc version 4.6.3 (Ubuntu/Linaro
4.6.3-1ubuntu5) ) #1 SMP Wed Apr 10 11:55:58 CEST 2013

NOTE: There still exists the NULL-pointer-deref in cpufreq for me on
Intel SandyBridge CPU (see [5]) on reboot and when CPUs get offline.

- Sedat -

[0] https://lkml.org/lkml/2013/4/7/229
[1] http://marc.info/?l=linux-next&m=136552249527170&w=2
[2] http://marc.info/?t=136545773000008&r=1&w=2
[3] http://marc.info/?t=136545603700003&r=1&w=2
[4] http://marc.info/?l=linux-next&m=136552718229123&w=2
[5] http://marc.info/?t=136551588400003&r=1&w=2
