From: Nathan Myers <ncm@cantrip.org>
Subject: Re: Application for decoding ACPI tables under Linux
Date: Mon, 1 Aug 2005 12:04:07 -0700
Message-ID: <20050801190407.GB10941@cantrip.org>
References: <84EA05E2CA77634C82730353CBE3A84301CFC307@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFC307@SAUSEXMB1.amd.com>
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
To: cpufreq@lists.linux.org.uk

On Mon, Aug 01, 2005 at 01:39:42PM -0500, Langsdorf, Mark wrote:
> Is there a Linux tool for decoding ACPI tables?   ...
> 
> -Mark Langsdorf
> AMD, Inc.

Yes, but not for you.  

Intel posts a tool called "acpica" for download.  It's a nuisance
getting it to build; don't be squeamish about editing yacc output.

Nathan Myers
ncm@cantrip.org
