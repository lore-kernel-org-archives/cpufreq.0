From: "Moore, Robert" <robert.moore@intel.com>
Subject: Dynamic frequency governor
Date: Fri, 17 Oct 2003 14:14:38 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi all,

I've been chartered to implement a multi-state algorithm for Linux;
this will be a new governor that adjusts the CPU frequency based upon
percent CPU utilization as reported from the kernel idle handler.

Has any work been done (or is being done) in this area?  I don't want to
rewrite the wheel.

Thanks,
Bob Moore
Intel Corporation
