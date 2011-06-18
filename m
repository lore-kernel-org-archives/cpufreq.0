From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V2 5/6] cpufreq: Add compatibility hack to powernow-k8
Date: Sat, 18 Jun 2011 13:28:34 +0200
Message-ID: <20110618112834.GD7445@liondog.tnic>
References: <1308340257-10117-1-git-send-email-mjg@redhat.com>
 <1308340257-10117-5-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308396517; bh=Lq/bcFX4NZW66YfzyqsW6a3dqZ+K29eOnXApzW7V43g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=WZSeILULVtHN
	rtMDuzSDyoJPJq5Nx4a4+oDpSEH2nQAWn+A7fmKSz5RvJ9tr72/8L0I/MPMBB6HDkkA
	hq0KZsD1ZW1UJoQPpKIgWvpH2TQlUFd4Y2waJpBF+SessfrEdPovmVwg2iFCkDtwz7k
	fkujCxoLw/A2/TjXYZl7db57E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308396517; bh=Lq/bcFX4NZW66YfzyqsW6a3dqZ+K29eOnXApzW7V43g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=WZSeILULVtHN
	rtMDuzSDyoJPJq5Nx4a4+oDpSEH2nQAWn+A7fmKSz5RvJ9tr72/8L0I/MPMBB6HDkkA
	hq0KZsD1ZW1UJoQPpKIgWvpH2TQlUFd4Y2waJpBF+SessfrEdPovmVwg2iFCkDtwz7k
	fkujCxoLw/A2/TjXYZl7db57E=
Content-Disposition: inline
In-Reply-To: <1308340257-10117-5-git-send-email-mjg@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org, andreas.herrmann3@amd.com

On Fri, Jun 17, 2011 at 03:50:56PM -0400, Matthew Garrett wrote:
> cpufreq modules are often loaded from init scripts that assume that a=
ll
> recent AMD systems will use powernow-k8, so we should ensure that loa=
ding
> it triggers a load of acpi-cpufreq if the latter is built as a module=
=2E
> This avoids the problem of users ending up without any cpufreq suppor=
t
> after the transition.
>=20
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> ---
>  drivers/cpufreq/powernow-k8.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow=
-k8.c
> index 83479b6..8591ec8 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -1545,8 +1545,12 @@ static int __cpuinit powernowk8_init(void)
>  			supported_cpus++;
>  	}
> =20
> -	if (supported_cpus !=3D num_online_cpus())
> +	if (supported_cpus !=3D num_online_cpus()) {
> +		if (cpu_has(0, X86_FEATURE_HW_PSTATE))

you mean here
		if (boot_cpu_has(X86_FEATURE_HW_PSTATE))

otherwise:

drivers/cpufreq/powernow-k8.c: In function =E2=80=98powernowk8_init=E2=80=
=99:
drivers/cpufreq/powernow-k8.c:1553: error: invalid type argument of =E2=
=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
drivers/cpufreq/powernow-k8.c:1553: error: invalid type argument of =E2=
=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
make[2]: *** [drivers/cpufreq/powernow-k8.o] Error 1
make[1]: *** [drivers/cpufreq] Error 2
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....


> +			request_module("acpi_cpufreq");
> +
>  		return -ENODEV;
> +	}
> =20
>  	printk(KERN_INFO PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
>  		num_online_nodes(), boot_cpu_data.x86_model_id, supported_cpus);
> --=20
> 1.7.5.2

--=20
Regards/Gruss,
    Boris.
