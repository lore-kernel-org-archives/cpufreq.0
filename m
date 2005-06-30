From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: More Pentium III (Coppermine) problems
Date: Fri, 1 Jul 2005 00:25:00 +0200
Message-ID: <20050630222500.GA8564@isilmar.linta.de>
References: <edaeffdd05063015115b422687@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <edaeffdd05063015115b422687@mail.gmail.com>
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
To: Jaime =?iso-8859-1?Q?Pe=F1alba?= <jpenalbae@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

please try out

modprobe speedstep-smi smi_cmd=0x82 smi_port=0xb2 smi_sig=1


	Dominik
