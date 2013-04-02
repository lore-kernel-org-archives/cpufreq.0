From: Guru Prasad <gurupras@buffalo.edu>
Subject: Re: Unit of cpuinfo.transition_latency
Date: Tue, 2 Apr 2013 11:07:34 -0400
Message-ID: <CAMefCkCkSzrKUHD4QK_akr9Lc2sqW6uwxeHFHVk82uK5oz4yfA@mail.gmail.com>
References: <CAMefCkA3zy8-+DA2zQYirkvNyZcwYUDAsWBYhR_4TEF3b9DZQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=jj+kZ5zxNgRwhXVCQ7yLzdwVPTQQld2iWym51IA8IdI=;
        b=CHP7f7lYtb8LhLICuVfZTwXixrcS2/jQqbVDzOQK+IPPKj3j1qAP8fzfkiTvRIve+9
         pqlSlRMV41T3hqMdv3DUGPV5TavEkXkC41CkgLLJ7fasPU819xdF7t4I+NYuObxD93Ag
         msqSLpm1U68963vM1+bFSCP08K8xu5dkjbpKjBSzG4RC2I4jb62/jqwmxz0Y4oaxwdul
         lGyDsqO+X89TJGGN/8pKUQvYWzCwpW4Gg+DoiANm1G5gW2tUhzuuK1yCd7I08PZIvRuV
         1sYwjz9ifX27Zf9+QJczlKcoQniKnZmpHb4Otv+L380NGev0WsasizPkbG0Xbaxb2WjW
         WJhQ==
In-Reply-To: <CAMefCkA3zy8-+DA2zQYirkvNyZcwYUDAsWBYhR_4TEF3b9DZQA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I've been working with kernel versions 2.6.35.8 and 3.3.0 particularly
with the ARM architecture and I'm quite confused with the units of
transition_latency..

mach-integrator/cpu.c:    policy->cpuinfo.transition_latency =
1000000; /* 1 ms, assumed */
mach-pxa/cpufreq-pxa2xx.c:    policy->cpuinfo.transition_latency =
1000; /* FIXME: 1 ms, assumed */
mach-pxa/cpufreq-pxa3xx.c:    policy->cpuinfo.transition_latency =
1000; /* FIXME: 1 ms, assumed */

These seem to be contradicting each other..
The first line seems to suggest that the base unit is nanoseconds..
The second and third lines suggest that the unit is microseconds..

Could someone please shed some light on this?
