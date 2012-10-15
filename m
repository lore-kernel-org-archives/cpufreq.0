From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq, powernow-k8: Remove usage of smp_processor_id() in preemptible code
Date: Mon, 15 Oct 2012 19:56:33 +0200
Message-ID: <2671294.5qjGox1KcF@vostro.rjw.lan>
References: <20121009193844.GC7724@alberich> <1395148.DypXQr3MdC@vostro.rjw.lan> <20121015084011.GA5000@liondog.tnic>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20121015084011.GA5000@liondog.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Borislav Petkov <bp@alien8.de>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-pm@vger.kernel.org

On Monday 15 of October 2012 10:40:11 Borislav Petkov wrote:
> On Mon, Oct 15, 2012 at 07:50:13AM +0200, Rafael J. Wysocki wrote:
> > Well, please don't tag patches for -stable, because -stable doesn't
> > take _patches_.
>=20
> Really, I didn't know that?! :-)
>=20
> > It takes commits from the Linus' tree and backports them and that's
> > maintainer's job to tag them for -stable, not yours.
>=20
> You're not serious, right? This is not the case in at least 50% of th=
e
> cases.
>=20
> And this is OK because maintainers don't always know whether the patc=
h
> should be tagged for stable. So yes, people should add the stable tag
> and yes, committers still have a veto over it.
>=20
> And yes, Andreas and I *know* how stable patches get applied, thank y=
ou
> very much.

I didn't say you didn't know that.

> [ =E2=80=A6 ]
>=20
> > Yes, they do, but that means it doesn't make sense to send them stu=
ff
> > before it's been merged, right?
>=20
> Ok, I get it, you don't want people to send patches to stable@vger
> *before* they've hit mainline.
>=20
> Nothing in <Documentation/stable_kernel_rules.txt> states that
> stable@vger shouldn't get CCed on submissions unless the patch is
> upstream and besides, stable@vger gets CCed in a lot of discussions
> anyway so there's other traffic just the same.
>=20
> Bottomline: If you think people shouldn't spam stable@vger, then toug=
h
> luck - I don't think you can stop people from accidentally/due to the
> automated nature of the process, CC stable. Even if it said so in the
> above doc file.
>=20
> As a result, stable maintainers simply rely on scripts which verify t=
he
> patch is actually upstream before applying it to stable.

Well, perhaps I shouldn't care too, then. :-)

Thanks,
Rafael


--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
