From: "Leisner, Martin" <Martin.Leisner@xerox.com>
Subject: powernow_decode_msr never got into the mainstream kernel?
Date: Thu, 13 Mar 2008 12:13:47 -0400
Message-ID: <556445368AFA1C438794ABDA8901891C083F0C56@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@lists.linux.org.uk
Cc: Bram Lupiro Lauwira <braml@sdsp.mc.xerox.com>

There's a patch wrt 2.6.8.1 for powernow-k7 when the bios doesn't
give useful information...

We ported this patch to 2.6.20.11...
The original is here:
http://www.yggdrasl.demon.co.uk/code/
http://www.yggdrasl.demon.co.uk/code/powernow-k7-msr-2.6.8.1.patch

I just looked at 2.6.24.3, and it seems like this functionality isn't
there?  Any reason?

marty
