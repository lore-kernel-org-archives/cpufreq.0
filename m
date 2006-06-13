From: "Brown, Len" <len.brown@intel.com>
Subject: RE: [PATCH] allow powersave as default governor
Date: Tue, 13 Jun 2006 15:52:01 -0400
Message-ID: <CFF307C98FEABE47A452B27C06B85BB6B89BF1@hdsmsx411.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: =?iso-8859-1?Q?Reimar_D=F6ffinger?= <Reimar.Doeffinger@stud.uni-karlsruhe.de>, cpufreq@lists.linux.org.uk


>On Wed, May 31, 2006 at 07:05:30PM +0200, Reimar D?ffinger wrote:
>> this patch against linux 2.6.16.16 kernel adds the powersave=20
>governor to
>> the list of possible default governors.
>> Avoids noisy fan e.g. during fsck when no userspace governor=20
>> is running yet.

What MHz does the noisy system boot at when cpufreq is not loaded at =
all?

If it boots in low-frequency-mode, then perhaps cpufreq should
not load any governor until it can load its governor of choice,
and the window where this issue is seen would go away?

-Len
