From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Fix hole
Date: Thu, 28 Dec 2006 22:29:18 -0500
Message-ID: <20061229032918.GA4516@redhat.com>
References: <458E7AD7.4070306@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <458E7AD7.4070306@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk

On Sun, Dec 24, 2006 at 02:04:23PM +0100, Rafa=C5=82 Bilski wrote:
 > User with Nehemiah B is complain that Longhaul don't=20
 > work for him. I don't know much about this issue in=20
 > this moment, but looking at source I see possible bug=20
 > related to ACPI PM2 register. Patch below.

Can you go into some more detail for the purpose of the changelog?
The above is very vague.

 >  static int __devexit longhaul_cpu_exit(struct cpufreq_policy *policy)
 > @@ -774,8 +779,8 @@ static int __init longhaul_init(void)
 > =20
 >  #ifdef CONFIG_SMP
 >  	if (num_online_cpus() > 1) {
 > -		return -ENODEV;
 >  		printk(KERN_ERR PFX "More than 1 CPU detected, longhaul disabled.\n");
 > +		return -ENODEV;
 >  	}
 >  #endif

Gah, I recall fixing this at least twice. Somehow that didn't get pushed ou=
t.
I'll commit this bit separately whilst I'm waiting for the description
of the other patch.

Thanks,

		Dave

--=20
http://www.codemonkey.org.uk
