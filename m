From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 15:12:44 +0100
Message-ID: <1108908764.6282.59.camel@laptopd505.fenrus.org>
References: <20050220131518.GB4495@inskipp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050220131518.GB4495@inskipp>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Alexander Clouter <alex@digriz.org.uk>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, linux@dominikbrodowski.de

On Sun, 2005-02-20 at 13:15 +0000, Alexander Clouter wrote:
> Adds support to cpufreq_ondemand to ignore 'nice' cpu time

this increasingly starts to smell like it wants this policy in
userspace.....
