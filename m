From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: patch for powernow-k8 problem (Mobile Sempron 2800+, Acer
 Aspire 1362 )
Date: Tue, 16 Nov 2004 12:25:50 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84301539DCA@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>

diff -r -u old/powernow-k8.c new/powernow-k8.c
--- old/powernow-k8.c	2004-11-15 21:02:20.988038920 -0600
+++ new/powernow-k8.c	2004-11-15 21:37:06.077057208 -0600
@@ -279,7 +279,7 @@
 			return 1;
 	}
=20
-	while (rvosteps > 0) {
+	while ( (rvosteps > 0) && ( (data->rvo + data->currvid) > reqvid
) ) {
 		if (data->currvid =3D=3D 0) {
 			rvosteps =3D 0;
 		} else {
