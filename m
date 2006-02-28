From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 11:22:37 -0500
Message-ID: <20060228162237.GE7317@redhat.com>
References: <B3870AD84389624BAF87A3C7B831499302935655@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <B3870AD84389624BAF87A3C7B831499302935655@SAUSEXMB2.amd.com>
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
Content-Transfer-Encoding: 7bit
To: "shin, jacob" <jacob.shin@amd.com>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Andi Kleen <ak@suse.de>

On Mon, Feb 27, 2006 at 07:54:36PM -0600, shin, jacob wrote:
 > +	data->currvid = data->currvid;
 > +	data->currfid = data->currfid;

ummm ?

		Dave
