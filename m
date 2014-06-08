From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 2/2] e_powersaver: Require setting a module parameter to
 enable it
Date: Mon, 09 Jun 2014 00:22:21 +0100
Message-ID: <1402269741.23860.50.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vWYZQn6x06Cm0n+5/FlK"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, =?UTF-8?Q?Rafa=C5=82?= Bilski <rafalbilski@interia.pl>


--=-vWYZQn6x06Cm0n+5/FlK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Kconfig text and comment at the top of the file say this is
DANGEROUS.  According to Rafa=C5=82 Bilski it is not so bad as it used to
be, but he still didn't think it should be auto-loaded.

Rafa=C5=82 already made a similar change to longhaul.

References: http://www.spinics.net/lists/cpufreq/msg02919.html
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/cpufreq/e_powersaver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersaver.=
c
index a0d2a42..880be39 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -45,6 +45,7 @@ static struct eps_cpu_data *eps_cpu[NR_CPUS];
 static int freq_failsafe_off;
 static int voltage_failsafe_off;
 static int set_max_voltage;
+static int enable;
=20
 #if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MODULE
 static int ignore_acpi_limit;
@@ -410,6 +411,10 @@ static int __init eps_init(void)
 {
 	if (!x86_match_cpu(eps_cpu_id) || boot_cpu_data.x86_model < 10)
 		return -ENODEV;
+	if (!enable) {
+		printk(KERN_ERR "eps: Option \"enable\" not set. Aborting.\n");
+		return -ENODEV;
+	}
 	if (cpufreq_register_driver(&eps_driver))
 		return -EINVAL;
 	return 0;
@@ -432,6 +437,10 @@ MODULE_PARM_DESC(ignore_acpi_limit, "Don't check ACPI'=
s processor speed limit");
 #endif
 module_param(set_max_voltage, int, 0644);
 MODULE_PARM_DESC(set_max_voltage, "Set maximum CPU voltage (mV) C7-M only"=
);
+/* By default driver is disabled to prevent incompatible
+ * system freeze. */
+module_param(enable, int, 0644);
+MODULE_PARM_DESC(enable, "Enable driver");
=20
 MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
 MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");

--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-vWYZQn6x06Cm0n+5/FlK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5TwLee/yOyVhhEJAQqv5BAAtWf9ycqIntlwxrJds5hhbDruCww+ePFH
Os4ViFWgKHpXBV/OjQRfAAWq535J6wt2OI4Wie6sSYWlJVZSR0z35tVhTSzMku5m
pF2Jt1Wxkfig8A9QJqFhiu+e5EMVtHMnLZ9lmwcAYDlBO+o1JqUxiIGCU2zGCJt1
8HjXwJKcQ8PMQqeKjP1COJUXLXbC7hsJv+2rGQlj4NK7WBfLiy8UM3hKKf6WQdLH
LfAJMsSeQqEjTAgc6Ii3gaS6VSq5JnPFVfyd8BGoOajNpR2BcrGM1Se6wiSY2iSh
HINPhSSdIjgYnfSFIqwEql8m6iPZsaFe9xmZCS/nWDEeJYW/3/agLTl6aZfOT4bP
6WKYb0Ei7sq/t8/6TPkgwQ6hcTKxs0H/iHlMHcfETo4h/OwfPkgOkXWcBJZJskD/
eTM9IqCIMhGbP3oAy31tUSfkwmixR/QyyRuos7pXflUd08rQvZDFqDA50lLdPv7x
9p+SC2KrvuPZfiqhcGUFaIVFiY7a0i2HyFWq6s6MSzQnew3TkQFHcxr2RYL+w1sb
TLRI9gvx9dlqSziKUAuNsN1fs466OhxKCkEE/a/wURTGkbx+D5Xm6e9zB7BwdLp7
lccX1jjM8P/auGBi6sV/fbRrPWL1DwWQJ41zIyyYZWoG5YLNnuD5p9jlCcXVnvm0
lUKz6e/Um4I=
=j+9I
-----END PGP SIGNATURE-----

--=-vWYZQn6x06Cm0n+5/FlK--
