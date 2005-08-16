From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Adjusting CPU core voltages via sysfs on Centrino
Date: Tue, 16 Aug 2005 10:56:09 +0200
Message-ID: <20050816085609.GK9150@dominikbrodowski.de>
References: <42F77AA5.4030403@holmberg.info>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <42F77AA5.4030403@holmberg.info>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rickard Holmberg <rickard@holmberg.info>
Cc: cpufreq@lists.linux.org.uk

Hi,

I'd suggest _not_ applying this patch to the Linux kernel as per the same
reasons we do not have table overrides / voltage overrides for powernow-k8.
In addition, the voltage encoding does change across EST revisions, IIRC.
Thirdly, with the new powerop infrastructure in discussion, I'd like to
avoid adding things we'd need to handle in an "compatibility mode".

Thanks,
	Dominik
