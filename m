From: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Subject: Segmentation faults on AMD
Date: Wed, 13 Jun 2007 10:55:04 -0400
Message-ID: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hi,

I have followed all instructions to install this tool on :
1.) AMD Opteron(tm) Processor 252
2.) AMD Opteron (tm) Processor 885

I keep getting segmentation faults.

Can you please help?

nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -c 0
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
Segmentation fault
nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -c 1
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 1:
Segmentation fault
nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -e
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
Segmentation fault
nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -o
          minimum CPU frequency  -  maximum CPU frequency  -  governor
Segmentation fault
nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -m
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
Segmentation fault

-Thanks
Tushar
