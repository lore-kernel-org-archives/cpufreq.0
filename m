From: "Leisner, Martin" <Martin.Leisner@xerox.com>
Subject: writing a frequency scaling processor module
Date: Fri, 7 Sep 2007 13:04:51 -0400
Message-ID: <556445368AFA1C438794ABDA8901891C066B5BD9@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I'm writing a cpufreq module for the ppc 7448 processor.

Its very nice the way cpufreq is laid out with the governors...is there
a=20
"cookbook" approach to writing a processor interface?

I looked at cpu-drivers.txt in the kernel tree, and it's somewhat vague
and=20
confusing (IMHO).

I'm using p4-clocmod.c as an example, are there better examples?

marty
