From: Ronald van der Meer <revdmeer@conceptsfa.nl>
Subject: Mobile Intel Pentium 4 + ICH5
Date: Thu, 12 Feb 2004 00:37:43 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1076542663.4323.17.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi,

I have a laptop with an Mobile Intel(R) Pentium(R) 4 cpu and a 82801EB
ICH5 southbridge.
I can use the p4-clockmod driver, but it doesn't seem to save any power
because it only changes the frequency and doesn't do voltage scaling.
The speedstep-ich driver only seems to support ICH2, 3 and 4 but not 5.
Is voltage scaling speedstep possible for this laptop?

cheers,

Ronald
