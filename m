From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Wed, 11 Jun 2008 09:56:56 -0700 (PDT)
Message-ID: <20080611165657.0164711D10C@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10658


mjg59-kernel@srcf.ucam.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #16166|0                           |1
        is obsolete|                            |
  Attachment #16227|0                           |1
        is obsolete|                            |




------- Comment #54 from mjg59-kernel@srcf.ucam.org  2008-06-11 09:56 -------
Created an attachment (id=16459)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=16459&action=view)
Implement management in the generic thermal class

Martin, any chance you can give this a go? It works fine here, keeping the
temperature at the defined level. It uses the generic thermal class rather than
the somewhat hacky approach of doing it in the ACPI layer.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
