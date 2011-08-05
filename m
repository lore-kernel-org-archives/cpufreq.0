From: Matt Turner <mattst88@gentoo.org>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD only?)
Date: Fri, 5 Aug 2011 18:01:47 -0400
Message-ID: <CAEdQ38FCJS1aT4Um2qbw-shHFWjg28QfrfXYvdnzFo2YzaAczw@mail.gmail.com>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com>
 <20110731085706.GB19629@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110731085706.GB19629@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org, Juergen Rose <rose@rz.uni-potsdam.de>

On Sun, Jul 31, 2011 at 4:57 AM, Dominik Brodowski
<linux@dominikbrodowski.net> wrote:
> Hey,
>
> On Sun, Jul 31, 2011 at 12:46:31AM -0400, Matt Turner wrote:
>> I've got a bug report about cpufreq-set -r not setting all related
>> CPUs. It appears to be a problem with AMD CPUs only.
>>
>> https://bugs.gentoo.org/show_bug.cgi?id=3D376565
>>
>> Any ideas what's going on?
>
> What's the output of cpufreq-info on these systems? Might it be that =
the
> CPUs on this AMD system may be set to different frequencies? "-r" onl=
y sets
> the governor on all _related_ CPUs, not on all CPUs found on the syst=
em.
>
> Best,
> =A0 =A0 =A0 =A0Dominik

Hi Dominik,

Juergen posted some output in
https://bugs.gentoo.org/show_bug.cgi?id=3D376565 and I think also sent
it to you.

It looks to me like either the CPU isn't required to use the same
frequency for all cores, or it's a kernel bug reporting incorrect
information to cpufrequtils. What do you think?

Matt
