From: Matthew Garrett <mjg@redhat.com>
Subject: Re: mistake about the cpufreq?
Date: Tue, 5 Jul 2011 18:55:08 +0100
Message-ID: <20110705175508.GC30531@srcf.ucam.org>
References: <BANLkTin4P7X0gbbShNTQNpV0khq3Bb9PhQ@mail.gmail.com>
 <BANLkTimgadBqULuQXVdr-=e792b6RZLQSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimgadBqULuQXVdr-=e792b6RZLQSg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?5L+e6aKQ6LaF?= <yyc1992@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Fri, Jul 01, 2011 at 09:17:08PM -0400, =E4=BF=9E=E9=A2=90=E8=B6=85 w=
rote:

> So after reading the files in cpu-freq/, I saw it was mentioned in
> user-guide.txt that the scaling_ ones is what the kernel thinks the
> freq is and cpuinfo is the actual freq.
> y can these two be different?

Many systems don't have independently clockable cores. In that case the=
=20
cpu will run at the speed of the highest clocked core.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
