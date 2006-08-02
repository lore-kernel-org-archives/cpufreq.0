From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of cpufreq
 drivers
Date: Wed, 02 Aug 2006 22:44:34 +0400
Message-ID: <44D0F292.8090403@linux.intel.com>
References: <44CE4F8A.5060600@linux.intel.com>
	<20060802092733.GI17014@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060802092733.GI17014@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Bruno Ducrot wrote:
> I've not checked carrefully but it seems to me you are breaking
> powernow-k8.
We do not touch powernow-k8, and tried to make sure we do not change
acpi-cpufreq to exclude any unknown hardware. What we tried to do, is to merge
different ways of accessing cpufreq with ACPI under single driver. Could you be
more specific how we break powernow-k8?

Alex.
